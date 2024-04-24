# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 12:27:55 2024

@author: nohel
"""
import sys
#sys.path.append('E:\Znaceni_dat\MM_segmentation\Functions')
sys.path.append('..\Functions')
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
import os
join = os.path.join
import nibabel as nib
import json
import numpy as np

#%%

if __name__ == "__main__":
    base = 'E:/Znaceni_dat/Data/'   
    task_id = 908
    version_name = "_trabecular_seg_nnUNet_v_1_0"
    task_name = "Lumbar_spine_seg" 
    foldername = "Dataset%03.0d_%s" % (task_id, task_name) 
    path_to_crop_parameters = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername,'crop_parameters/')  
    
    # %% folder with predicted data from nnUNet
    path_to_predicted_segmentations=join('E://nnUNet_v2_MAIN_FILE/nnUNet_results/predict', foldername)
    
    # output folder for full size image
    crop_parameters_folder = join(path_to_predicted_segmentations, "Predict_clin_data_crop_rotovane_zpet_full_size") 
    maybe_mkdir_p(crop_parameters_folder) 
    
    predict_pacients=['Healthy_006','Healthy_007','Healthy_008','Healthy_009','Healthy_010','Myel_001', 'Myel_002', 'Myel_003', 'Myel_004', 'Myel_005', 'Myel_006', 'Myel_007', 'Myel_008', 'Myel_009', 'Myel_010']
    for t in predict_pacients: 
        current_path=join(path_to_crop_parameters,t)
        #open json file and get coordinates
        f=open(current_path+'.json')
        data = json.load(f)
        orig_size=data['orig_size']
        min_coords=data['min_coords']
        max_coords=data['max_coords']
        f.close()
        
        #VMI 40keV - load nifti info
        vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI')
        image_file = join(curr, vmi_40kev)
        img = nib.load(image_file)
        #load predicted data
        predicted_file=path_to_predicted_segmentations+'/Predict_clin_data_crop_rotovane_zpet/'+t+'.nii.gz'
        predicted_mask = nib.load(predicted_file)
        predicted_mask_data=predicted_mask.get_fdata()
        #create full size image
        full_size_mask=np.zeros(orig_size)
        full_size_mask[min_coords[0]:max_coords[0]+1, min_coords[1]:max_coords[1]+1, min_coords[2]:max_coords[2]+1]=predicted_mask_data
        #save full size image
        pom_full_size_mask = nib.Nifti1Image(full_size_mask, img.affine, img.header)
        nib.save(pom_full_size_mask, join(crop_parameters_folder, t + version_name + ".nii.gz"))
 
    
    
    
    