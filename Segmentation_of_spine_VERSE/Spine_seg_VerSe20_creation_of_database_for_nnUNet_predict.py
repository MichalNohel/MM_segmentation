# -*- coding: utf-8 -*-
"""
Created on Tue Dec 19 14:10:00 2023

@author: nohel
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Dec 19 12:53:43 2023

@author: nohel
"""

import sys
import os
sys.path.append(('../'))
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil

join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    #imagests = 'D:/BMD_analysis/DATA/BMD_conv'
    #reorient_all_images_in_folder_to_ras(imagests,1)
    #imagests = 'E:/nnUNet_v2_MAIN_FILE/nnUNet_raw/Dataset800_Spine_segmentation_VerSe20/imagesTs/Predikce_BMD_001_016'
    #reorient_all_images_in_folder_to_ras(imagests,1)
    
    ### 
    #base = 'E:/Znaceni_dat/Data/'
    #base = 'E:/Znaceni_dat/Data_pom/'
    #base = 'D:\BMD_analysis\DATA/'
    base = 'D:\BMD_analysis\DATA_kontrast/'
    
    task_id = 800
    task_name = "Spine_segmentation_VerSe20"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    #imagests = join(out_base, "imagesTs/Predikce_myel_001_040")
    imagests = join(out_base, "imagesTs/Predikce_BMD_contrast_001_016")
    
    maybe_mkdir_p(imagests)   
    train_patient_names = []
    num_training_cases = 0
    
    
    #for t in subdirs(base, join=False,prefix="Myel_"): 
    for t in subdirs(base, join=False,prefix="BMD_"): 
        #imagests - složka s testovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        shutil.copy(image_file, join(imagests, t + "_0000.nii.gz"))
    
    
    
    #%%
    
    
    reorient_all_images_in_folder_to_ras(imagests,1)