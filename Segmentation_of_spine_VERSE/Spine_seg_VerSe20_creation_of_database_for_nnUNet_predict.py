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


from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    #base = 'E:/Znaceni_dat/Data/'
    base = 'E:/Znaceni_dat/Data_pom/'
    
    task_id = 800
    task_name = "Spine_segmentation_VerSe20"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    #imagests = join(out_base, "imagesTs/Predikce_myel_001_040")
    imagests = join(out_base, "imagesTs/Predikce_myel_041_081")
    
    maybe_mkdir_p(imagests)   
    train_patient_names = []
    num_training_cases = 0
    
    
    for t in subdirs(base, join=False,prefix="Myel_"): 
        #imagests - složka s testovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        shutil.copy(image_file, join(imagests, t + "_0000.nii.gz"))
    
    
    
    #%%
    reorient_all_images_in_folder_to_ras(imagests,2)