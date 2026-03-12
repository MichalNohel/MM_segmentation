# -*- coding: utf-8 -*-
"""
Created on Wed Oct  8 10:12:12 2025

@author: nohel
"""

from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    
    # foldername = 'DATA_Myelomy'
    # out_base = join('I:/', foldername)  
    # maybe_mkdir_p(out_base)
    
    out_base = "D:\DATA_myelomy_Balog"
    train_pacients=os.listdir(base)
    
    for t in train_pacients: 
        maybe_mkdir_p(join(out_base,t))
        
        #konvenční CT
        # train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        # curr = join(base, t, 'ConvCT_data_nifti')
        # image_file = join(curr, train_patient_names)
        # shutil.copy(image_file, join(out_base,t,train_patient_names))
                
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI')
        image_file = join(curr, vmi_40kev)
        shutil.copy(image_file, join(out_base,t,vmi_40kev))
        
        #VMI 80keV
        # vmi_80kev=subfiles(join(base, t, 'VMI'), join=False, suffix="80kev.nii.gz")[0] 
        # curr = join(base, t, 'VMI')
        # image_file = join(curr, vmi_80kev)
        # shutil.copy(image_file, join(out_base,t,vmi_80kev))
        
        # #VMI 120keV
        # vmi_120kev=subfiles(join(base, t, 'VMI'), join=False, suffix="120kev.nii.gz")[0] 
        # curr = join(base, t, 'VMI')
        # image_file = join(curr, vmi_120kev)
        # shutil.copy(image_file, join(out_base,t,vmi_120kev))
        
        # #CaSupp25
        # casupp_25=subfiles(join(base, t, 'CaSupp'), join=False, suffix="CaSupp_25.nii.gz")[0] 
        # curr = join(base, t, 'CaSupp')
        # image_file = join(curr, casupp_25)
        # shutil.copy(image_file, join(out_base,t,casupp_25))
        
        #Vysegmentovaná páteř        
        
        if t.startswith('Healthy'):        
            train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]    
            curr = join(base, t, 'Spine_labels/NN_Unet')        
            image_file = join(curr, train_spine_segm)
            shutil.copy(image_file, join(out_base,t,train_spine_segm[:-14] + '.nii.gz'))
        else:
            train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
            curr = join(base, t, 'Spine_labels/NN_Unet')        
            image_file = join(curr, train_spine_segm)
            shutil.copy(image_file, join(out_base,t,train_spine_segm[:-18] + '.nii.gz'))
            
            #labelstr - složka s anotacemi lézí
            train_lesions_names = subfiles(join(base, t, 'Lesion_labels'), join=False, suffix="VV_final_semantic.nii.gz")[0]    
            curr = join(base, t, 'Lesion_labels')
            image_file = join(curr, train_lesions_names)
            shutil.copy(image_file, join(out_base, t, train_lesions_names [:-36]+ ".nii.gz"))
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        