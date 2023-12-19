# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 13:35:02 2023

@author: nohel
"""
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib


#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    
    task_id = 600
    version_name = "_lesions_seg_nnUNet_v_1_0"
    task_name = "MM" + version_name + "_konvCT_validation_MN"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    imagestr = join(out_base, "imagesTr")
    imagests = join(out_base, "imagesTs")
    labelstr = join(out_base, "labelsTr")   
    maybe_mkdir_p(imagestr)
    maybe_mkdir_p(imagests)
    maybe_mkdir_p(labelstr)    
    train_patient_names = []
    num_training_cases = 0
    
    ### Pouze convCT a maska obratlů
    #subdirs(base, join=False,prefix="Myel_01")
    train_pacients=['Myel_001', 'Myel_002', 'Myel_003', 'Myel_004', 'Myel_005', 'Myel_006', 'Myel_007', 'Myel_008', 'Myel_009', 'Myel_010']
    #for t in subdirs(base, join=False): 
    for t in train_pacients: 
        #imagestr - složka s trénovacími daty  
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        shutil.copy(image_file, join(imagestr, t + "_0000.nii.gz"))
        
        #Vysegmentovaná páteř        
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]    
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)
        img = nib.load(image_file)
        data=img.get_fdata()
        data=data.astype(bool) # maska obratlu nnUNet binarne    
        pom_seg_nn_unet_binar = nib.Nifti1Image(data, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagestr, t + "_0001.nii.gz")) 
        
        '''
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI_data_nifti'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI_data_nifti')
        image_file = join(curr, vmi_40kev)
        shutil.copy(image_file, join(imagestr, t + "_0002.nii.gz"))
        '''
        
        #labelstr - složka s anotacemi lézí
        train_lesions_names = subfiles(join(base, t, 'Lesion_labels'), join=False, suffix=".nii.gz")[0]    
        curr = join(base, t, 'Lesion_labels')
        image_file = join(curr, train_lesions_names)
        shutil.copy(image_file, join(labelstr, t + ".nii.gz"))
        
        num_training_cases += 1
    #%%
    generate_dataset_json(output_folder=out_base,
                          channel_names={0: "konvCT",1: "mask_spine", },
                          labels={"background": 0,"Lesion": 1,},
                          file_ending=".nii.gz",
                          num_training_cases=num_training_cases,)

    #%%
    #reorient_all_images_in_folder_to_ras(imagestr,1)
    #reorient_all_images_in_folder_to_ras(labelstr,1)