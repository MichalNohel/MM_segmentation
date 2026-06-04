# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 10:42:12 2026

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    
    out_base = "Z:\Multiple_Myeloma_Project\Spinal-Multiple-Myeloma-SEG-Final_Dataset\Spinal-Multiple-Myeloma-SEG_Trabecular_segmentation\DATA"
    train_pacients=os.listdir(base)
    
    
    for t in train_pacients: 
        if t.startswith('Myel'):  
            
            if (t == "Myel_017"):
                continue
            
            maybe_mkdir_p(join(out_base,t))                
            #VMI 40keV
            vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
            curr = join(base, t, 'VMI')
            image_file = join(curr, vmi_40kev)
            shutil.copy(image_file, join(out_base,t,vmi_40kev))
            
            #Segmented spine 
            train_spine_segm = subfiles(join(base, t, 'Spine_labels/Trabecular_masks'), join=False, suffix="trabecular_seg_nnUNet_v_1_0.nii.gz")[0]    
            curr = join(base, t, 'Spine_labels/Trabecular_masks')        
            image_file = join(curr, train_spine_segm)
            shutil.copy(image_file, join(out_base,t, t + '_trabecular_spine_segmentation_nnUNet_v_1_0.nii.gz'))
            shutil.copy(image_file, join(out_base,t, t + '_trabecular_spine_segmentation_nnUNet_v_1_0_cor.nii.gz'))

    
    
    
    