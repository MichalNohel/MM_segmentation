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
    
    task_id = 701
    task_name = "MM_lession_segmentation_model_01_konvCT"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)
    
    out_base = join('E://Znaceni_dat/nnUNet_MAIN_lesions/nnUNet_raw', foldername)  
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
    
    for t in subdirs(base, join=False):
        #imagestr složka        
        train_patient_names_here = [i[:-len(".nii.gz")] for i in
                                    subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")]
        train_patient_names_here=train_patient_names_here[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names_here + ".nii.gz")
        shutil.copy(image_file, join(imagestr, train_patient_names_here + "_0000.nii.gz"))
        
        train_lesions_names = [i[:-len(".nii.gz")] for i in
                                    subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine.nii.gz")]
    
        train_lesions_names=train_lesions_names[0]
        curr = join(base, t, 'Spine_labels/NN_Unet')
        image_file = join(curr, train_lesions_names + ".nii.gz")
        img = nib.load(image_file)
        data=img.get_fdata()
        data=data.astype(bool)
        
              
        # maska obratlu nnUNet binarne
        pom_seg_nn_unet_binar = nib.Nifti1Image(data, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagestr, train_patient_names_here + "_0001.nii.gz"))
        
        train_lesions_names = [i[:-len(".nii.gz")] for i in
                                    subfiles(join(base, t, 'Lesion_labels'), join=False, suffix=".nii.gz")]
    
        train_lesions_names=train_lesions_names[0]
        curr = join(base, t, 'Lesion_labels')
        image_file = join(curr, train_lesions_names + ".nii.gz")
        shutil.copy(image_file, join(labelstr, train_patient_names_here + ".nii.gz"))
        
        num_training_cases += 1

    generate_dataset_json(output_folder=out_base,
                          channel_names={0: "konvCT",1: "mask_spine", },
                          labels={"background": 0,"Lesion": 1,},
                          file_ending=".nii.gz",
                          num_training_cases=num_training_cases,)

    #%%
    reorient_all_images_in_folder_to_ras(imagestr,1)
    reorient_all_images_in_folder_to_ras(labelstr,1)