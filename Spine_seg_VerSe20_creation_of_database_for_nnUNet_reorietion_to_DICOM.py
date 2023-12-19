# -*- coding: utf-8 -*-
"""
Created on Wed Feb  8 13:26:54 2023

@author: nohel
"""
from nnU_Net_preprocesing_functions import revert_orientation_on_all_images_in_folder

#%%

if __name__ == "__main__":
    
    
    labels_klin_data = "E:/Znaceni_dat/Prevod_dicom_to_nifti/nifti_pro_nnU_Net/Task800_Segmentace_patere/Predikce_myel_041_081_result_rotovane_zpet" 
    
    revert_orientation_on_all_images_in_folder(labels_klin_data, 4)
