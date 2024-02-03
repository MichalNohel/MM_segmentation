# -*- coding: utf-8 -*-
"""
Created on Thu Feb  1 21:25:45 2024

@author: nohel
"""

#from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'   
    task_id = 908
    task_name = "Lumbar_spine_seg" 
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)   
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)    
    
    imagests = join(out_base, "imagesTs/Predict_clin_data")
    maybe_mkdir_p(imagests)   
    train_patient_names = []
    num_training_cases = 0
    
    train_pacients=['Healthy_006', 'Healthy_007', 'Healthy_008', 'Healthy_009', 'Healthy_010','Myel_002']
    
    for t in train_pacients: 
        #imagestr - složka s trénovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        shutil.copy(image_file, join(imagests, t + "_0000.nii.gz"))
    
    # %% Reorienation to RAS
    # now we reorient all those images to ras. This saves a pkl with the original affine. We need this information to
    # bring our predictions into the same geometry for submission
    # %%
    reorient_all_images_in_folder_to_ras(imagests,2)
    