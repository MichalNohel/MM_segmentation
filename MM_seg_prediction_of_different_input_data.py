# -*- coding: utf-8 -*-
"""
Created on Thu Aug  7 12:38:42 2025

@author: nohel
"""
import os
join = os.path.join
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p

if __name__ == "__main__":
        ### 
    base = 'E:/Znaceni_dat/Data/'
        
    task_id = 720
    version_name = "Data_for_input_analysis"
    
    task_name = "MM_" + version_name     
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)

    imagestr = join(out_base, "imagesTr")
    labelstr = join(out_base, "labelsTr")  