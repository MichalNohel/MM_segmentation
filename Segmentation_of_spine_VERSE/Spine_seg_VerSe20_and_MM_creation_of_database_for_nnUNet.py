# -*- coding: utf-8 -*-
"""
Created on Thu Aug 21 14:27:04 2025

@author: nohel
"""

import sys
sys.path.append('../')
import os
join = os.path.join
sys.path.append(os.path.abspath('F:/Spinal-Multiple-Myeloma-SEG/nnUNet'))
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import nibabel as nib
import numpy as np


#%%

if __name__ == "__main__":
    
    ### 
    base_verse = 'E:/DATA_zaloha_publikace_kody_k_publikacim/VerSe_2020/Data_verse_all' 
    base_MM_dataset = 'E:/Znaceni_dat/Data/'
    task_id = 802
    task_name = "Spine_segmentation_trained_on_VerSe20_and_MM_dataset_together"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    imagestr = join(out_base, "imagesTr")
    labelstr = join(out_base, "labelsTr")    
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(labelstr)     
    train_patient_names = []
    num_training_cases = 0
    
    # %% Training dataset VERSE20
    for t in subdirs(join(base_verse, '01_training'), join=False):
        train_patient_names_here = [i[:-len("_seg.nii.gz")] for i in
                                    subfiles(join(base_verse, "01_training", t), join=False, suffix="_seg.nii.gz")]
        for p in train_patient_names_here:
            curr = join(base_verse, "01_training", t)
            
            image_file = join(curr, p + ".nii.gz")
            nifti_info_for_all = nib.load(image_file)
            shutil.copy(image_file, join(imagestr, p + "_0000.nii.gz"))
            
            label_file = join(curr, p + "_seg.nii.gz")
            img = nib.load(label_file)
            data=img.get_fdata()  
            data = data.astype(np.uint8)
            pom_seg_spine = nib.Nifti1Image(data, nifti_info_for_all.affine, nifti_info_for_all.header)
            pom_seg_spine.set_data_dtype(np.uint8)
            nib.save(pom_seg_spine, join(labelstr, p + ".nii.gz")) 

            num_training_cases += 1 
        
        
    for t in subdirs(base_MM_dataset, join=False, prefix="Myel_"):         
        train_patient_names=subfiles(join(base_MM_dataset, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base_MM_dataset, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)        
        nifti_info_for_all = nib.load(image_file)
        shutil.copy(image_file, join(imagestr, t + "_0000.nii.gz"))
        
        
        train_spine_segm = subfiles(join(base_MM_dataset, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
        curr = join(base_MM_dataset, t, 'Spine_labels/NN_Unet')        
        label_file = join(curr, train_spine_segm)
        img = nib.load(label_file)
        data=img.get_fdata()  
        data = data.astype(np.uint8)
        pom_seg_spine = nib.Nifti1Image(data, nifti_info_for_all.affine, nifti_info_for_all.header)
        pom_seg_spine.set_data_dtype(np.uint8)
        nib.save(pom_seg_spine, join(labelstr, t + ".nii.gz")) 
        num_training_cases += 1 
        
    generate_dataset_json(output_folder=out_base,
                           name = task_name,
                           channel_names={0: "konvCT", },
                           labels={i: str(i) for i in range(29)},
                           file_ending=".nii.gz",
                           num_training_cases=num_training_cases,)
        
    
    # %% Reorienation to RAS
    # now we reorient all those images to ras. This saves a pkl with the original affine. We need this information to
    # bring our predictions into the same geometry for submission
    # %%
    reorient_all_images_in_folder_to_ras(imagestr, 1)
    
    #%%
    reorient_all_images_in_folder_to_ras(labelstr, 4)    
        
        
        
        
        
    