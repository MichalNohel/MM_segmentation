# -*- coding: utf-8 -*-
"""
Created on Sun Mar 26 17:38:29 2023

@author: nohel
"""

#%%
'Library import'
from typing import List,Tuple
from skimage import io
import json
import os
import numpy as np
import SimpleITK as sitk
from multiprocessing import Pool
from batchgenerators.utilities.file_and_folder_operations import *
import nibabel as nib
from nibabel import io_orientation
from batchgenerators.utilities.file_and_folder_operations import save_json, join


'Function definition'
def maybe_mkdir_p(directory: str) -> None:
    os.makedirs(directory, exist_ok=True)

def subfiles(folder: str, join: bool = True, prefix: str = None, suffix: str = None, sort: bool = True) -> List[str]:
    if join:
        l = os.path.join
    else:
        l = lambda x, y: y
    res = [l(folder, i) for i in os.listdir(folder) if os.path.isfile(os.path.join(folder, i))
           and (prefix is None or i.startswith(prefix))
           and (suffix is None or i.endswith(suffix))]
    if sort:
        res.sort()
    return res     
    
def convert_2d_image_to_nifti(input_filename: str, output_filename_truncated: str, spacing=(999, 1, 1),
                              transform=None, is_seg: bool = False) -> None:
    """
    Reads an image (must be a format that it recognized by skimage.io.imread) and converts it into a series of niftis.
    The image can have an arbitrary number of input channels which will be exported separately (_0000.nii.gz,
    _0001.nii.gz, etc for images and only .nii.gz for seg).
    Spacing can be ignored most of the time.
    !!!2D images are often natural images which do not have a voxel spacing that could be used for resampling. These images
    must be resampled by you prior to converting them to nifti!!!

    Datasets converted with this utility can only be used with the 2d U-Net configuration of nnU-Net

    If Transform is not None it will be applied to the image after loading.

    Segmentations will be converted to np.uint32!

    :param is_seg:
    :param transform:
    :param input_filename:
    :param output_filename_truncated: do not use a file ending for this one! Example: output_name='./converted/image1'. This
    function will add the suffix (_0000) and file ending (.nii.gz) for you.
    :param spacing:
    :return:
    """
    img = io.imread(input_filename)

    if transform is not None:
        img = transform(img)

    if len(img.shape) == 2:  # 2d image with no color channels
        img = img.transpose((1, 0))
        img = img[None, None]  # add dimensions
    else:
        assert len(img.shape) == 3, "image should be 3d with color channel last but has shape %s" % str(img.shape)
        # we assume that the color channel is the last dimension. Transpose it to be in first
        img = img.transpose((2, 1, 0))
        # add third dimension
        img = img[:, None]

    # image is now (c, x, x, z) where x=1 since it's 2d
    if is_seg:
        assert img.shape[0] == 1, 'segmentations can only have one color channel, not sure what happened here'

    for j, i in enumerate(img):

        if is_seg:
            i = i.astype(np.uint32)

        itk_img = sitk.GetImageFromArray(i)
        itk_img.SetSpacing(list(spacing)[::-1])
        if not is_seg:
            sitk.WriteImage(itk_img, output_filename_truncated + "_%04.0d.nii.gz" % j)
        else:
            sitk.WriteImage(itk_img, output_filename_truncated + ".nii.gz")
            
def get_identifiers_from_splitted_files(folder: str):
    uniques = np.unique([i[:-12] for i in subfiles(folder, suffix='.nii.gz', join=False)])
    return uniques

def generate_dataset_json(output_file: str, imagesTr_dir: str, imagesTs_dir: str, modalities: Tuple,
                          labels: dict, dataset_name: str, sort_keys=True, license: str = "hands off!", dataset_description: str = "",
                          dataset_reference="", dataset_release='0.0'):
    """
    :param output_file: This needs to be the full path to the dataset.json you intend to write, so
    output_file='DATASET_PATH/dataset.json' where the folder DATASET_PATH points to is the one with the
    imagesTr and labelsTr subfolders
    :param imagesTr_dir: path to the imagesTr folder of that dataset
    :param imagesTs_dir: path to the imagesTs folder of that dataset. Can be None
    :param modalities: tuple of strings with modality names. must be in the same order as the images (first entry
    corresponds to _0000.nii.gz, etc). Example: ('T1', 'T2', 'FLAIR').
    :param labels: dict with int->str (key->value) mapping the label IDs to label names. Note that 0 is always
    supposed to be background! Example: {0: 'background', 1: 'edema', 2: 'enhancing tumor'}
    :param dataset_name: The name of the dataset. Can be anything you want
    :param sort_keys: In order to sort or not, the keys in dataset.json
    :param license:
    :param dataset_description:
    :param dataset_reference: website of the dataset, if available
    :param dataset_release:
    :return:
    """
    train_identifiers = get_identifiers_from_splitted_files(imagesTr_dir)

    if imagesTs_dir is not None:
        test_identifiers = get_identifiers_from_splitted_files(imagesTs_dir)
    else:
        test_identifiers = []

    json_dict = {}
    json_dict['name'] = dataset_name
    json_dict['description'] = dataset_description
    json_dict['tensorImageSize'] = "4D"
    json_dict['reference'] = dataset_reference
    json_dict['licence'] = license
    json_dict['release'] = dataset_release
    json_dict['modality'] = {str(i): modalities[i] for i in range(len(modalities))}
    json_dict['labels'] = {str(i): labels[i] for i in labels.keys()}

    json_dict['numTraining'] = len(train_identifiers)
    json_dict['numTest'] = len(test_identifiers)
    json_dict['training'] = [
        {'image': "./imagesTr/%s.nii.gz" % i, "label": "./labelsTr/%s.nii.gz" % i} for i
        in
        train_identifiers]
    json_dict['test'] = ["./imagesTs/%s.nii.gz" % i for i in test_identifiers]

    if not output_file.endswith("dataset.json"):
        print("WARNING: output file name is not dataset.json! This may be intentional or not. You decide. "
              "Proceeding anyways...")
    save_json(json_dict, os.path.join(output_file), sort_keys=sort_keys)


def save_json(obj, file: str, indent: int = 4, sort_keys: bool = True) -> None:
    with open(file, 'w') as f:
        json.dump(obj, f, sort_keys=sort_keys, indent=indent)
        
def reorient_all_images_in_folder_to_ras(folder: str, num_processes: int = 2):
    p = Pool(num_processes)
    nii_files = subfiles(folder, suffix='.nii.gz', join=True)
    p.map(reorient_to_ras, nii_files)
    p.close()
    p.join()
    
def revert_orientation_on_all_images_in_folder(folder: str, num_processes: int = 1):
    p = Pool(num_processes)
    nii_files = subfiles(folder, suffix='.nii.gz', join=True)
    p.map(revert_reorientation, nii_files)
    p.close()
    p.join()

def reorient_to_ras(image: str) -> None:
    """
    Will overwrite image!!!
    :param image:
    :return:
    """
    assert image.endswith('.nii.gz')
    origaffine_pkl = image[:-7] + '_originalAffine.pkl'
    if not isfile(origaffine_pkl):
        img = nib.load(image)
        original_affine = img.affine
        original_axcode = nib.aff2axcodes(img.affine)
        img = img.as_reoriented(io_orientation(img.affine))
        new_axcode = nib.aff2axcodes(img.affine)
        print(image.split('/')[-1], 'original axcode', original_axcode, 'now (should be ras)', new_axcode)
        nib.save(img, image)
        save_pickle((original_affine, original_axcode), origaffine_pkl)


def revert_reorientation(image: str) -> None:
    assert image.endswith('.nii.gz')
    expected_pkl = image[:-7] + '_originalAffine.pkl'
    assert isfile(expected_pkl), 'Must have a file with the original affine, as created by ' \
                                 'reorient_to_ras. Expected filename: %s' % \
                                 expected_pkl
    original_affine, original_axcode = load_pickle(image[:-7] + '_originalAffine.pkl')
    img = nib.load(image)
    before_revert = nib.aff2axcodes(img.affine)
    img = img.as_reoriented(io_orientation(original_affine))
    after_revert = nib.aff2axcodes(img.affine)
    print('before revert', before_revert, 'after revert', after_revert)
    restored_affine = img.affine
    assert np.all(np.isclose(original_affine, restored_affine)), 'restored affine does not match original affine, ' \
                                                                 'aborting!'
    nib.save(img, image)
    os.remove(expected_pkl)
    
def generate_dataset_json(output_folder: str,
                          channel_names: dict,
                          labels: dict,
                          num_training_cases: int,
                          file_ending: str,
                          regions_class_order: Tuple[int, ...] = None,
                          dataset_name: str = None, reference: str = None, release: str = None, license: str = None,
                          description: str = None,
                          overwrite_image_reader_writer: str = None, **kwargs):
    """
    Generates a dataset.json file in the output folder

    channel_names:
        Channel names must map the index to the name of the channel, example:
        {
            0: 'T1',
            1: 'CT'
        }
        Note that the channel names may influence the normalization scheme!! Learn more in the documentation.

    labels:
        This will tell nnU-Net what labels to expect. Important: This will also determine whether you use region-based training or not.
        Example regular labels:
        {
            'background': 0,
            'left atrium': 1,
            'some other label': 2
        }
        Example region-based training:
        {
            'background': 0,
            'whole tumor': (1, 2, 3),
            'tumor core': (2, 3),
            'enhancing tumor': 3
        }

        Remember that nnU-Net expects consecutive values for labels! nnU-Net also expects 0 to be background!

    num_training_cases: is used to double check all cases are there!

    file_ending: needed for finding the files correctly. IMPORTANT! File endings must match between images and
    segmentations!

    dataset_name, reference, release, license, description: self-explanatory and not used by nnU-Net. Just for
    completeness and as a reminder that these would be great!

    overwrite_image_reader_writer: If you need a special IO class for your dataset you can derive it from
    BaseReaderWriter, place it into nnunet.imageio and reference it here by name

    kwargs: whatever you put here will be placed in the dataset.json as well

    """
    has_regions: bool = any([isinstance(i, (tuple, list)) and len(i) > 1 for i in labels.values()])
    if has_regions:
        assert regions_class_order is not None, f"You have defined regions but regions_class_order is not set. " \
                                                f"You need that."
    # channel names need strings as keys
    keys = list(channel_names.keys())
    for k in keys:
        if not isinstance(k, str):
            channel_names[str(k)] = channel_names[k]
            del channel_names[k]

    # labels need ints as values
    for l in labels.keys():
        value = labels[l]
        if isinstance(value, (tuple, list)):
            value = tuple([int(i) for i in value])
            labels[l] = value
        else:
            labels[l] = int(labels[l])

    dataset_json = {
        'channel_names': channel_names,  # previously this was called 'modality'. I didnt like this so this is
        # channel_names now. Live with it.
        'labels': labels,
        'numTraining': num_training_cases,
        'file_ending': file_ending,
    }

    if dataset_name is not None:
        dataset_json['name'] = dataset_name
    if reference is not None:
        dataset_json['reference'] = reference
    if release is not None:
        dataset_json['release'] = release
    if license is not None:
        dataset_json['licence'] = license
    if description is not None:
        dataset_json['description'] = description
    if overwrite_image_reader_writer is not None:
        dataset_json['overwrite_image_reader_writer'] = overwrite_image_reader_writer
    if regions_class_order is not None:
        dataset_json['regions_class_order'] = regions_class_order

    dataset_json.update(kwargs)

    save_json(dataset_json, join(output_folder, 'dataset.json'), sort_keys=False)

def get_3d_bounding_box(array):
    indices = np.argwhere(array != 0)
 
    if len(indices) == 0:
        return None
 
    min_coords = np.min(indices, axis=0)
    max_coords = np.max(indices, axis=0)
 
    return min_coords, max_coords
