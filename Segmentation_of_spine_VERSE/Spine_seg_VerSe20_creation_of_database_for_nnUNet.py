# -*- coding: utf-8 -*-
"""
Created on Tue Dec 19 12:53:43 2023

@author: nohel
"""
import sys
sys.path.append('..\Functions')
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/VerSe_2020/DATA_nnUNet/'
    
    task_id = 800
    task_name = "Spine_segmentation_VerSe20"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    imagestr = join(out_base, "imagesTr")
    imagests = join(out_base, "imagesTs/VerSe_test")
    labelstr = join(out_base, "labelsTr")   
    labelsts = join(out_base, "labelsTs/VerSe_test")   
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(imagests)
    maybe_mkdir_p(labelstr)    
    maybe_mkdir_p(labelsts)    
    train_patient_names = []
    num_training_cases = 0
    
    #%% Training dataset
    for t in subdirs(join(base, '01_training'), join=False):
        train_patient_names_here = [i[:-len("_seg.nii.gz")] for i in
                                    subfiles(join(base, "01_training", t), join=False, suffix="_seg.nii.gz")]
        for p in train_patient_names_here:
            curr = join(base, "01_training", t)
            label_file = join(curr, p + "_seg.nii.gz")
            image_file = join(curr, p + ".nii.gz")
            shutil.copy(image_file, join(imagestr, p + "_0000.nii.gz"))
            shutil.copy(label_file, join(labelstr, p + ".nii.gz"))

        train_patient_names += train_patient_names_here
        
    
    generate_dataset_json(output_folder=out_base,
                          channel_names={0: "konvCT", },
                          labels={i: str(i) for i in range(29)},
                          file_ending=".nii.gz",
                          num_training_cases=len(train_patient_names),)
    
    #%% Testing dataset
    for t in subdirs(join(base, '03_test'), join=False):
        train_patient_names_here = [i[:-len("_seg.nii.gz")] for i in
                                    subfiles(join(base, "03_test", t), join=False, suffix="_seg.nii.gz")]
        for p in train_patient_names_here:
            curr = join(base, "03_test", t)
            label_file = join(curr, p + "_seg.nii.gz")
            image_file = join(curr, p + ".nii.gz")
            shutil.copy(image_file, join(imagests, p + "_0000.nii.gz"))
            shutil.copy(label_file, join(labelsts, p + ".nii.gz"))
            
    # %% Reorienation to RAS
    # now we reorient all those images to ras. This saves a pkl with the original affine. We need this information to
    # bring our predictions into the same geometry for submission
    # %%
    reorient_all_images_in_folder_to_ras(imagestr, 1)
    #%%
    reorient_all_images_in_folder_to_ras(imagests, 4)
    #%%
    reorient_all_images_in_folder_to_ras(labelstr, 4)    
    #%%
    reorient_all_images_in_folder_to_ras(labelsts, 6)
    
    
    
    
    
    