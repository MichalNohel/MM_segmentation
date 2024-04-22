# -*- coding: utf-8 -*-
"""
Created on Mon Apr 22 13:54:26 2024

@author: nohel
"""

import sys
#sys.path.append('E:\Znaceni_dat\MM_segmentation\Functions')
sys.path.append('..\Functions')
from nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json,get_3d_bounding_box,NumpyArrayEncoder
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
    task_id = 908
    task_name = "Lumbar_spine_seg" 

    foldername = "Dataset%03.0d_%s" % (task_id, task_name)   
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)    
    
    imagests = join(out_base, "imagesTs/Predict_clin_data_crop")
    crop_parameters_folder = join(out_base, "crop_parameters") 
       
    
    maybe_mkdir_p(imagests)   
    maybe_mkdir_p(crop_parameters_folder)
    train_patient_names = []
    num_training_cases = 0
    
    vertebrae_index=18
    safety_margin=20 #pocet pixelu o kolik se zvětší okraj segmentace
    
    train_pacients=['Healthy_006','Healthy_007','Healthy_008','Healthy_009','Healthy_010','Myel_001', 'Myel_002', 'Myel_003', 'Myel_004', 'Myel_005', 'Myel_006', 'Myel_007', 'Myel_008', 'Myel_009', 'Myel_010']
    
    for t in train_pacients: 
        
        #Vysegmentovaná páteř a detekce BB      
        #train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]    
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        nii_img[nii_img<vertebrae_index]=0
        nii_img=nii_img.astype(bool) # maska obratlu nnUNet binarne 
        
        min_coords, max_coords = get_3d_bounding_box(nii_img)  # nalezeni BB pro 3D     
        orig_size=nii_img.shape
        min_coords=min_coords-safety_margin
        max_coords=max_coords+safety_margin
        
        coordinates={'orig_size': orig_size, 'min_coords': min_coords,'max_coords': max_coords}    # uložení JSON souboru
        with open(join(crop_parameters_folder, t + ".json"), "w") as f:
            json.dump(coordinates, f, cls=NumpyArrayEncoder)
        
        #imagestr - složka s trénovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()        
                

        pom_seg_nn_unet_binar = nib.Nifti1Image(cut_nii_img, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagests, t + "_0000.nii.gz")) 
    
    # %% Reorienation to RAS
    # now we reorient all those images to ras. This saves a pkl with the original affine. We need this information to
    # bring our predictions into the same geometry for submission
    # %%
    reorient_all_images_in_folder_to_ras(imagests,2)