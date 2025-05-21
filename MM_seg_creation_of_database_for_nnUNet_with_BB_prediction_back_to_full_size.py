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
    task_id = 652
    version_name = "_lesions_seg_nnUNet_v_2_2"
    task_name = "MM" + version_name + "_VMI_40_validation_VV"   
    foldername = "Dataset%03.0d_%s" % (task_id, task_name) 
    path_to_crop_parameters = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername,'crop_parameters/Prediction/')  
    # %% folder with predicted data from nnUNet
    path_to_predicted_segmentations=join('E://nnUNet_v2_MAIN_FILE/nnUNet_results/predict', foldername)
    # output folder for full size image
    #crop_parameters_folder = join(path_to_predicted_segmentations, "Predikce_myel_061_065_full_size") 
    crop_parameters_folder = join(path_to_predicted_segmentations, "nnUNetTrainer_MedNeXt_L__nnUNetPlans__3d_fullres_full_size") 
    maybe_mkdir_p(crop_parameters_folder) 
    
    
    version_name = "_lesions_seg_nnUNet_v_2_2_MedNeXt_L"
    
    #predict_pacients=['Myel_012', 'Myel_018', 'Myel_023', 'Myel_024', 'Myel_043', 'Myel_047', 'Myel_052', 'Myel_059', 'Myel_069', 'Myel_070']
    #predict_pacients=['Myel_011', 'Myel_014', 'Myel_015', 'Myel_016', 'Myel_017', 'Myel_019', 'Myel_020', 'Myel_021', 'Myel_022', 'Myel_025', 'Myel_026','Myel_027','Myel_028','Myel_029','Myel_030','Myel_031','Myel_033','Myel_034','Myel_036','Myel_038','Myel_039','Myel_040']
    #predict_pacients=['Myel_041', 'Myel_042', 'Myel_043','Myel_044','Myel_045','Myel_046','Myel_047', 'Myel_048','Myel_050','Myel_051','Myel_052','Myel_053','Myel_054','Myel_055','Myel_056','Myel_057','Myel_058','Myel_059','Myel_060']
    #predict_pacients=['Myel_061', 'Myel_062', 'Myel_063', 'Myel_064', 'Myel_065']
    predict_pacients=['Myel_066', 'Myel_067', 'Myel_068', 'Myel_071', 'Myel_072','Myel_077', 'Myel_078', 'Myel_079', 'Myel_080', 'Myel_081','Myel_017', 'Myel_022', 'Myel_025', 'Myel_043', 'Myel_044','Myel_053', 'Myel_061', 'Myel_062', 'Myel_063', 'Myel_064','Myel_065']
    
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
        #predicted_file=path_to_predicted_segmentations+'/Predikce_myel_061_065/'+t+'.nii.gz'
        predicted_file=path_to_predicted_segmentations+'/nnUNetTrainer_MedNeXt_L__nnUNetPlans__3d_fullres/'+t+'.nii.gz'
        predicted_mask = nib.load(predicted_file)
        predicted_mask_data=predicted_mask.get_fdata()
        #create full size image
        full_size_mask=np.zeros(orig_size,dtype=bool)
        full_size_mask[min_coords[0]:max_coords[0]+1, min_coords[1]:max_coords[1]+1, min_coords[2]:max_coords[2]+1]=predicted_mask_data
        #save full size image
        pom_full_size_mask = nib.Nifti1Image(full_size_mask, img.affine, img.header)
        nib.save(pom_full_size_mask, join(crop_parameters_folder, t + version_name + ".nii.gz"))
    
    
    