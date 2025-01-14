# -*- coding: utf-8 -*-
"""
Created on Tue Oct  8 13:37:53 2024

@author: nohel
"""
#%%
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join

if __name__ == "__main__":
    base = 'E:/Znaceni_dat/Data/'
    predict_pacients=['Myel_011', 'Myel_014', 'Myel_015', 'Myel_016', 'Myel_017', 'Myel_019', 'Myel_020', 'Myel_021', 'Myel_022', 'Myel_025', 'Myel_026','Myel_027','Myel_028','Myel_029','Myel_030','Myel_031','Myel_033','Myel_034','Myel_036','Myel_038','Myel_039','Myel_040']
    out_base = join('E:/Znaceni_dat/', 'MM_DATA_for_validation_myel_011_040')  
    maybe_mkdir_p(out_base)
    for t in predict_pacients: 
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
        image_file = join(base, t + '/VMI/',vmi_40kev)
        out_folder=join(out_base,t)
        maybe_mkdir_p(out_folder)
        shutil.copy(image_file, join(out_folder, vmi_40kev))
        
        
        #labelstr - složka s anotacemi lézí
        train_lesions_names = subfiles(join(base, t, 'Lesion_labels'), join=False, suffix="nnUNet_v_2_1_semantic.nii.gz")[0]    
        curr = join(base, t, 'Lesion_labels')
        image_file = join(curr, train_lesions_names)
        shutil.copy(image_file, join(out_folder, train_lesions_names))
        
        
        