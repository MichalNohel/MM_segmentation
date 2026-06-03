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
        maybe_mkdir_p(join(out_base,t))                
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI')
        image_file = join(curr, vmi_40kev)
        shutil.copy(image_file, join(out_base,t,vmi_40kev))
        
        #Segmented spine   
        
        if t.startswith('Myel'):        
            train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
            curr = join(base, t, 'Spine_labels/NN_Unet')        
            image_file = join(curr, train_spine_segm)
            shutil.copy(image_file, join(out_base,t,train_spine_segm[:-18] + '.nii.gz'))

    
    
    
    