# -*- coding: utf-8 -*-
"""
Created on Fri Nov 10 23:37:03 2023

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
    #base = 'E:/Znaceni_dat/Data_pom/'
    base = 'E:/Znaceni_dat/Data_pom2/'
    
    task_id = 600
    task_name = "MM_lesion_segmentation"
    version_name = "_lesion_seg_nnUNet_v_1_0"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://Znaceni_dat/nnUNet_MAIN_lesions/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    imagests = join(out_base, "imagesTs/Predikce_myel_031_040")
     
    maybe_mkdir_p(imagests)   
    train_patient_names = []
    num_training_cases = 0
    
    ### Pouze convCT a maska obratlů
    #subdirs(base, join=False,prefix="Myel_01")
    for t in subdirs(base, join=False): 
        #imagests - složka s testovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        shutil.copy(image_file, join(imagests, t + version_name + "_0000.nii.gz"))
        
        #Vysegmentovaná páteř        
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]    
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)
        img = nib.load(image_file)
        data=img.get_fdata()
        data=data.astype(bool) # maska obratlu nnUNet binarne    
        pom_seg_nn_unet_binar = nib.Nifti1Image(data, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagests, t + version_name + "_0001.nii.gz")) 
        
        '''
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI_data_nifti'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI_data_nifti')
        image_file = join(curr, vmi_40kev)
        shutil.copy(image_file, join(imagests, t + "_0002.nii.gz"))
        '''
        

    #%%
    #reorient_all_images_in_folder_to_ras(imagests,1)
    
    
    