# -*- coding: utf-8 -*-
"""
Created on Mon Jan 27 12:06:49 2025

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p
from batchgenerators.utilities.file_and_folder_operations import *
import os
join = os.path.join
import shutil
#%%

if __name__ == "__main__":
    
    base = 'E:/Znaceni_dat/Data/'
    out_base = 'E:/Znaceni_dat/Data_pom'   
   
    train_pacients=subdirs(base, join=False,prefix="Myel_")
    
    for t in train_pacients: 
        
        #create outputFile
        out_base_cur = join(out_base, t)
        
        if os.path.isdir(out_base_cur):
            continue
        
        maybe_mkdir_p(out_base_cur)
        source_folder = join(base, t, 'ConvCT_data_dicom')
        
        destination_folder =  join (out_base_cur,'ConvCT_data_dicom')
        shutil.copytree(source_folder, destination_folder)
        
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]  
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)        
        shutil.copy(image_file, join(out_base_cur,train_spine_segm))
        
        train_spine_lumb_segm = subfiles(join(base, t, 'Spine_labels/Trabecular_masks'), join=False, suffix="trabecular_seg_nnUNet_v_1_0.nii.gz")
        if len(train_spine_lumb_segm)>0:
            train_spine_lumb_segm = train_spine_lumb_segm[0]
            curr = join(base, t, 'Spine_labels/Trabecular_masks')        
            image_file = join(curr, train_spine_lumb_segm)        
            shutil.copy(image_file, join(out_base_cur,train_spine_lumb_segm))
        
        
        
        train_lesions_names = subfiles(join(base, t, 'Lesion_labels'), join=False, suffix="validation_VV_final.nii.gz")   
        if len(train_lesions_names)>0:
            train_lesions_names = train_lesions_names[0]
            curr = join(base, t, 'Lesion_labels')
            image_file = join(curr, train_lesions_names)
            shutil.copy(image_file, join(out_base_cur,train_lesions_names))
        
        
        
    
    
    
    
    