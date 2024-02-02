# -*- coding: utf-8 -*-
"""
Created on Thu Feb  1 21:25:45 2024

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/LumVBCanSeg/'    
    task_id = 908
    task_name = "Lumbar_spine_seg" 
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)   
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)    
    imagestr = join(out_base, "imagesTr")
    imagests = join(out_base, "imagesTs/LumVBCanSeg_test")
    labelstr = join(out_base, "labelsTr")  
    labelsts = join(out_base, "labelsTs/LumVBCanSeg_test") 
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(imagests)
    maybe_mkdir_p(labelstr)  
    maybe_mkdir_p(labelsts)  
 
    num_training_cases = 0
    
    #%% Training dataset
    train_patient_names_here = [i[:-len("_seg.nii.gz")] for i in subfiles(join(base, "Task908"), join=False, suffix="_seg.nii.gz")]
    number_of_patients=len(train_patient_names_here)
    percent_of_training=0.8
    number_of_training_patient=round(number_of_patients*percent_of_training)
    index=0
    for p in train_patient_names_here:
        curr = join(base, "Task908")
        label_file = join(curr, p + "_seg.nii.gz")
        image_file = join(curr, p + ".nii.gz")
        
        #trainig        
        if  index<number_of_training_patient:
            shutil.copy(image_file, join(imagestr, p + "_0000.nii.gz"))
            shutil.copy(label_file, join(labelstr, p + ".nii.gz"))
            num_training_cases = num_training_cases+1
        #testing
        else:
            shutil.copy(image_file, join(imagests, p + "_0000.nii.gz"))
            shutil.copy(label_file, join(labelsts, p + ".nii.gz"))
        
        index=index+1
       
    
    generate_dataset_json(output_folder=out_base,
                          channel_names={0: "konvCT", },
                          labels={"background": 0,"L1": 1,"L2": 2,"L3": 3,"L4": 4,"L5": 5,},
                          file_ending=".nii.gz",
                          num_training_cases=num_training_cases)
    
    
    # %% Reorienation to RAS
    # now we reorient all those images to ras. This saves a pkl with the original affine. We need this information to
    # bring our predictions into the same geometry for submission
    # %%
    reorient_all_images_in_folder_to_ras(imagestr, 4)
    #%%
    reorient_all_images_in_folder_to_ras(imagests, 4)
    #%%
    reorient_all_images_in_folder_to_ras(labelstr, 4)   
    #%%
    reorient_all_images_in_folder_to_ras(labelsts, 4)
    