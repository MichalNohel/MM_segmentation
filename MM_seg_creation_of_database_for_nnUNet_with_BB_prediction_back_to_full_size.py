# -*- coding: utf-8 -*-
"""
Created on Sat Apr 20 22:14:43 2024

@author: nohel
"""
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
import os
join = os.path.join
import nibabel as nib
import json
import numpy as np

#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    task_id = 650
    version_name = "_lesions_seg_nnUNet_v_2_0"
    task_name = "MM" + version_name + "_VMI_40_validation_VV"   
    foldername = "Dataset%03.0d_%s" % (task_id, task_name) 
    path_to_crop_parameters = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername,'crop_parameters/Prediction/')  
    # %% folder with predicted data from nnUNet
    path_to_predicted_segmentations=join('E://nnUNet_v2_MAIN_FILE/nnUNet_results/predict', foldername)
    # output folder for full size image
    crop_parameters_folder = join(path_to_predicted_segmentations, "Predikce_follow_ups_full_size") 
    maybe_mkdir_p(crop_parameters_folder) 
    
    
    
    
    predict_pacients=['Myel_012', 'Myel_018', 'Myel_023', 'Myel_024', 'Myel_043', 'Myel_047', 'Myel_052', 'Myel_059', 'Myel_069', 'Myel_070']
    for t in predict_pacients: 
        current_path=join(path_to_crop_parameters,t)
    f=open(current_path+'.json')
    data = json.load(f)
    orig_size=data['orig_size']
    min_coords=data['min_coords']
    max_coords=data['max_coords']
    f.close()
    
    t=predict_pacients[0]
    #VMI 40keV
    vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
    curr = join(base, t, 'VMI')
    image_file = join(curr, vmi_40kev)
    img = nib.load(image_file)
    
    predicted_file=path_to_predicted_segmentations+'/Predikce_follow_ups/'+t+'.nii.gz'
    predicted_mask = nib.load(predicted_file)
    predicted_mask_data=predicted_mask.get_fdata()
    
    full_size_mask=np.zeros(orig_size,dtype=bool)
    full_size_mask[min_coords[0]:max_coords[0]+1, min_coords[1]:max_coords[1]+1, min_coords[2]:max_coords[2]+1]=predicted_mask_data
    

    
      
    
    
    pom_full_size_mask = nib.Nifti1Image(full_size_mask, img.affine, img.header)
    nib.save(pom_full_size_mask, join(crop_parameters_folder, t + version_name + ".nii.gz"))
    
    
    