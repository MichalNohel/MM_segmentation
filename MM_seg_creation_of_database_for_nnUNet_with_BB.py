# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 13:35:02 2023

@author: nohel
"""
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib
import numpy as np


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    
    task_id = 650
    version_name = "_lesions_seg_nnUNet_v_2_0"
    task_name = "MM" + version_name + "_konvCT_validation_VV_with_BB"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    '''
    imagestr = join(out_base, "imagesTr")
    imagests = join(out_base, "imagesTs")
    labelstr = join(out_base, "labelsTr")   
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(imagests)
    maybe_mkdir_p(labelstr)    
    train_patient_names = []
    num_training_cases = 0
    '''
    
    ### Pouze convCT a maska obratlů
    t='Myel_002'
    train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]
    curr = join(base, t, 'Spine_labels/NN_Unet')        
    image_file = join(curr, train_spine_segm)
    img = nib.load(image_file)
    data=img.get_fdata()
    data=data.astype(bool) # maska obratlu nnUNet binarne 
    cols = np.any(data,axis=0)
    rows = np.any(data, axis=1)    
    z_slices = np.any(data, axis=2)
    
    rmin, rmax = np.where(rows)[0][[0, -1]]
    cmin, cmax = np.where(cols)[0][[0, -1]]
    zmin, zmax = np.where(z_slices)[0][[0, -1]]
    
    data_withBB=data.copy()
    np_seg = np.array(data_withBB)
    segmentation = np.where(np_seg == 1)
    
    pom_seg_nn_unet_binar = nib.Nifti1Image(data, img.affine, img.header)
    nib.save(pom_seg_nn_unet_binar, join(imagestr, t + "_0001.nii.gz"))
    '''
    # the fuction
    def bounding_box(img):
    rows = np.any(img, axis=1)
    cols = np.any(img, axis=0)
    rmin, rmax = np.where(rows)[0][[0, -1]]
    cmin, cmax = np.where(cols)[0][[0, -1]]
    return rmin, rmax, cmin, cmax # y1, y2, x1, x2 

    # process the mask array with the above function
    bounding_box(img=mask_up)
    '''
    
    
    
    
    
    
    
    
    
    
    
    
    
