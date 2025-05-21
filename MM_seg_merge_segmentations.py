# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 10:36:50 2025

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
import os
join = os.path.join
import nibabel as nib
import numpy as np

if __name__ == "__main__":
    base = 'E:/Znaceni_dat/Data/'
    
    version_name = "_lesions_seg_nnUNet_v_2_2_merge"
    path_to_folder_with_segmentation = 'E:/nnUNet_v2_MAIN_FILE/nnUNet_results/predict/Dataset652_MM_lesions_seg_nnUNet_v_2_2_VMI_40_validation_VV/' 
    
    predict_pacients=['Myel_066', 'Myel_067', 'Myel_068', 'Myel_071', 'Myel_072','Myel_077', 'Myel_078', 'Myel_079', 'Myel_080', 'Myel_081','Myel_017', 'Myel_022', 'Myel_025', 'Myel_043', 'Myel_044','Myel_053', 'Myel_061', 'Myel_062', 'Myel_063', 'Myel_064','Myel_065']
    
    output_folder = join(path_to_folder_with_segmentation,'Merge_segm_nnUnet_MedNeXt')
    maybe_mkdir_p(output_folder) 
    
    for t in predict_pacients: 
        path_to_segmentation = join(path_to_folder_with_segmentation,'nnUNetTrainer__nnUNetPlans__3d_fullres_full_size',t+'_lesions_seg_nnUNet_v_2_2.nii.gz')
        predicted_mask = nib.load(path_to_segmentation)
        predicted_mask_data=predicted_mask.get_fdata()
        
        path_to_MedNeXt_segmentation = join(path_to_folder_with_segmentation,'nnUNetTrainer_MedNeXt_L__nnUNetPlans__3d_fullres_full_size', t +'_lesions_seg_nnUNet_v_2_2_MedNeXt_L.nii.gz')
        predicted_mask_MedNeXt = nib.load(path_to_MedNeXt_segmentation)
        predicted_mask_MedNeXt_data=predicted_mask_MedNeXt.get_fdata()
        
        
        merge_mask = np.zeros(predicted_mask.shape,dtype=bool)
        
        merge_mask =  predicted_mask_data + predicted_mask_MedNeXt_data
        merge_mask = merge_mask.astype(bool)
        
        
        pom_merge_mask = nib.Nifti1Image(merge_mask, predicted_mask.affine, predicted_mask.header)
        nib.save(pom_merge_mask, join(output_folder, t + version_name + ".nii.gz"))
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        