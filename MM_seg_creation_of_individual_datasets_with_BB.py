# -*- coding: utf-8 -*-
"""
Created on Mon May 26 12:49:20 2025

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json, get_3d_bounding_box, get_3d_bounding_box_padding, NumpyArrayEncoder
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib
import numpy as np


if __name__ == "__main__":
        ### 
    base = 'E:/Znaceni_dat/Data/'
    
    # task_id = 709
    # version_name = "_ConvCT"
    
    # task_id = 710
    # version_name = "_VMI_40"
    
    # task_id = 711
    # version_name = "_VMI_80"
    
    # task_id = 712
    # version_name = "_VMI_120"
    
    # task_id = 713
    # version_name = "_CaSupp_25"
    
    # task_id = 714
    # version_name = "_CaSupp_50"
    
    # task_id = 715
    # version_name = "_CaSupp_75"
    
    # task_id = 716
    # version_name = "_CaSupp_100"
    #task_name = "MM_Lesion_seg_just" + version_name 
    
    # task_id = 717
    # version_name = "_all_VMI"
    
    task_id = 718
    version_name = "_all_CaSupp"
    
    
    task_name = "MM_Lesion_seg" + version_name     
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)

    imagestr = join(out_base, "imagesTr")
    labelstr = join(out_base, "labelsTr")  
    
    crop_parameters_folder = join(out_base, "crop_parameters") 
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(labelstr)    
    maybe_mkdir_p(crop_parameters_folder) 
    train_patient_names = []
    num_training_cases = 0
    
    for t in subdirs(base, join=False, prefix="Myel_"): 
        
        #%%
        # Load nifti info from ConvCT for saving all patients
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        nifti_info_for_all = nib.load(image_file)
        
        #%%                
        #Load segmentation of spine and creation of BB      
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        nii_img=nii_img.astype(bool) # vertebrae mask from nnUNet binary 
        
        padding = 5 
        min_coords, max_coords = get_3d_bounding_box_padding(nii_img, padding)  # creation of BB for 3D 
        
        orig_size=nii_img.shape
        
        coordinates={'orig_size': orig_size, 'min_coords': min_coords,'max_coords': max_coords}   # uložení JSON souboru
        with open(join(crop_parameters_folder, t + ".json"), "w") as f:
            json.dump(coordinates, f, cls=NumpyArrayEncoder)
            
            
        # creation of crop spine seg mask
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()
        
        aux_var_spine_seg_nn_unet = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
        #%%
        #labelstr - folder with anotations
        lesions_seg_GT= subfiles(join(base, t, 'Lesion_labels'), join=False, suffix="validation_VV_final.nii.gz")[0]    
        curr = join(base, t, 'Lesion_labels')
        image_file = join(curr, lesions_seg_GT)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        
        nii_img=nii_img.astype(bool) # maska lezi binarne 
        
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        aux_var_lesions_seg_GT = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)        
        
        num_training_cases += 1 
        
        #%% Saving of dataset 
        #saving of labels
        nib.save(aux_var_lesions_seg_GT, join(labelstr, t + ".nii.gz"))
        
        #%% Preparation of input data
        
        # %% Dataset709_MM_Lesion_seg_just_ConvCT
        # conventional CT 
    #     conv_CT=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
    #     curr = join(base, t, 'ConvCT_data_nifti')
    #     image_file = join(curr, conv_CT)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()
    #     aux_var_ConvCT = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)  
        
    #     nib.save(aux_var_ConvCT, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "ConvCT",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
        
        # %% Dataset710_MM_Lesion_seg_just_VMI_40
        #VMI 40keV
    #     vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_40kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_40kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header) 
        
    #     nib.save(aux_var_vmi_40kev, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "VMI_40",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
        
        # %% Dataset711_MM_Lesion_seg_just_VMI_80
        #VMI 80keV
    #     vmi_80kev=subfiles(join(base, t, 'VMI'), join=False, suffix="80kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_80kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_80kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_vmi_80kev, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "VMI_80",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
    
        # %% Dataset712_MM_Lesion_seg_just_VMI_120
    #     #VMI 120keV
    #     vmi_120kev=subfiles(join(base, t, 'VMI'), join=False, suffix="120kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_120kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_120kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_vmi_120kev, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "VMI_120",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
    
        # %% Dataset713_MM_Lesion_seg_just_CaSupp_25
    #     #CaSupp 25
    #     CaSupp_25=subfiles(join(base, t, 'CaSupp'), join=False, suffix="25.nii.gz")[0] 
    #     curr = join(base, t, 'CaSupp')
    #     image_file = join(curr, CaSupp_25)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_CaSupp_25 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_CaSupp_25, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "CaSupp_25",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
    
        # %% Dataset714_MM_Lesion_seg_just_CaSupp_50
        #CaSupp 50
        # CaSupp_50=subfiles(join(base, t, 'CaSupp'), join=False, suffix="50.nii.gz")[0] 
        # curr = join(base, t, 'CaSupp')
        # image_file = join(curr, CaSupp_50)
        # img = nib.load(image_file)
        # nii_img=img.get_fdata()
        # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
        #               min_coords[1]:max_coords[1]+1,
        #               min_coords[2]:max_coords[2]+1].copy()

        # aux_var_CaSupp_50 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_CaSupp_50, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "CaSupp_50",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
    
        # %% Dataset715_MM_Lesion_seg_just_CaSupp_75
        #CaSupp 75
        # CaSupp_75=subfiles(join(base, t, 'CaSupp'), join=False, suffix="75.nii.gz")[0] 
        # curr = join(base, t, 'CaSupp')
        # image_file = join(curr, CaSupp_75)
        # img = nib.load(image_file)
        # nii_img=img.get_fdata()
        # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
        #               min_coords[1]:max_coords[1]+1,
        #               min_coords[2]:max_coords[2]+1].copy()

        # aux_var_CaSupp_75 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_CaSupp_75, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "CaSupp_75",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
    
        # %% Dataset716_MM_Lesion_seg_just_CaSupp_100
        #CaSupp 100
        # CaSupp_100=subfiles(join(base, t, 'CaSupp'), join=False, suffix="100.nii.gz")[0] 
        # curr = join(base, t, 'CaSupp')
        # image_file = join(curr, CaSupp_100)
        # img = nib.load(image_file)
        # nii_img=img.get_fdata()
        # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
        #               min_coords[1]:max_coords[1]+1,
        #               min_coords[2]:max_coords[2]+1].copy()

        # aux_var_CaSupp_100 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_CaSupp_100, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0001.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "CaSupp_100",1: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
        
        # %% Dataset717_MM_Lesion_seg_all_VMI
    #     #VMI 40keV
    #     vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_40kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_40kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header) 
        
    #     #VMI 80keV
    #     vmi_80kev=subfiles(join(base, t, 'VMI'), join=False, suffix="80kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_80kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_80kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     #VMI 120keV
    #     vmi_120kev=subfiles(join(base, t, 'VMI'), join=False, suffix="120kev.nii.gz")[0] 
    #     curr = join(base, t, 'VMI')
    #     image_file = join(curr, vmi_120kev)
    #     img = nib.load(image_file)
    #     nii_img=img.get_fdata()
    #     cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
    #                   min_coords[1]:max_coords[1]+1,
    #                   min_coords[2]:max_coords[2]+1].copy()

    #     aux_var_vmi_120kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
    #     nib.save(aux_var_vmi_40kev, join(imagestr, t + "_0000.nii.gz")) 
    #     nib.save(aux_var_vmi_80kev, join(imagestr, t + "_0001.nii.gz")) 
    #     nib.save(aux_var_vmi_120kev, join(imagestr, t + "_0002.nii.gz")) 
    #     nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0003.nii.gz"))  # Spine segmentation         
    # generate_dataset_json(output_folder=out_base,
    #                       name = task_name,
    #                       channel_names={0: "VMI_40",1: "VMI_80",2: "VMI_120",3: "mask_spine", },
    #                       labels={"background": 0,"Lesions": 1,},
    #                       file_ending=".nii.gz",
    #                       num_training_cases=num_training_cases,)
        
        # %% Dataset718_MM_Lesion_seg_all_CaSupp
        #CaSupp 25
        CaSupp_25=subfiles(join(base, t, 'CaSupp'), join=False, suffix="25.nii.gz")[0] 
        curr = join(base, t, 'CaSupp')
        image_file = join(curr, CaSupp_25)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        aux_var_CaSupp_25 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header) 
        
        #CaSupp 50
        CaSupp_50=subfiles(join(base, t, 'CaSupp'), join=False, suffix="50.nii.gz")[0] 
        curr = join(base, t, 'CaSupp')
        image_file = join(curr, CaSupp_50)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        aux_var_CaSupp_50 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
        #CaSupp 75
        CaSupp_75=subfiles(join(base, t, 'CaSupp'), join=False, suffix="75.nii.gz")[0] 
        curr = join(base, t, 'CaSupp')
        image_file = join(curr, CaSupp_75)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        aux_var_CaSupp_75 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
        
        #CaSupp 100
        CaSupp_100=subfiles(join(base, t, 'CaSupp'), join=False, suffix="100.nii.gz")[0] 
        curr = join(base, t, 'CaSupp')
        image_file = join(curr, CaSupp_100)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        aux_var_CaSupp_100 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)

        
        nib.save(aux_var_CaSupp_25, join(imagestr, t + "_0000.nii.gz")) 
        nib.save(aux_var_CaSupp_50, join(imagestr, t + "_0001.nii.gz")) 
        nib.save(aux_var_CaSupp_75, join(imagestr, t + "_0002.nii.gz")) 
        nib.save(aux_var_CaSupp_100, join(imagestr, t + "_0003.nii.gz")) 
        nib.save(aux_var_spine_seg_nn_unet, join(imagestr, t + "_0004.nii.gz"))  # Spine segmentation         
    generate_dataset_json(output_folder=out_base,
                          name = task_name,
                          channel_names={0: "CaSupp_25",1: "CaSupp_50",2: "CaSupp_75",3: "CaSupp_100",4: "mask_spine", },
                          labels={"background": 0,"Lesions": 1,},
                          file_ending=".nii.gz",
                          num_training_cases=num_training_cases,)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        