# -*- coding: utf-8 -*-
"""
Created on Thu Apr 11 09:03:00 2024

@author: nohel
"""
import sys
sys.path.append('..\Functions')
from nnU_Net_preprocesing_functions import revert_orientation_on_all_images_in_folder

#%%

if __name__ == "__main__":
    
    
    labels_klin_data = "E:/nnUNet_v2_MAIN_FILE/nnUNet_results/predict/Dataset908_Lumbar_spine_seg_result/Predict_clin_data_result_rotovane_zpet" 
    
    revert_orientation_on_all_images_in_folder(labels_klin_data, 4)