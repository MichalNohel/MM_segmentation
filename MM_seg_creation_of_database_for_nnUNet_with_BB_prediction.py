# -*- coding: utf-8 -*-
"""
Created on Fri Apr 19 23:01:43 2024

@author: nohel
"""
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p,subfiles,reorient_all_images_in_folder_to_ras, generate_dataset_json, get_3d_bounding_box,NumpyArrayEncoder
from batchgenerators.utilities.file_and_folder_operations import *
import shutil
import os
join = os.path.join
import nibabel as nib

#%%

if __name__ == "__main__":
    
    ### 
    base = 'E:/Znaceni_dat/Data/'
    task_id = 650
    version_name = "_lesions_seg_nnUNet_v_2_0"
    task_name = "MM" + version_name + "_VMI_40_validation_VV"
    
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw', foldername)  
    maybe_mkdir_p(out_base)
    
    imagests = join(out_base, "imagesTs/Predikce_follow_ups")
    crop_parameters_folder = join(out_base, "crop_parameters/Prediction") 
     
    maybe_mkdir_p(imagests)   
    maybe_mkdir_p(crop_parameters_folder) 
    train_patient_names = []
    num_training_cases = 0 
    
    ### Pouze VMI a maska obratlů
    #subdirs(base, join=False,prefix="Myel_01")
    predict_pacients=['Myel_012', 'Myel_018', 'Myel_023', 'Myel_024', 'Myel_043', 'Myel_047', 'Myel_052', 'Myel_059', 'Myel_069', 'Myel_070']
    #for t in subdirs(base, join=False): 
    for t in predict_pacients: 
        #imagestr - složka s trénovacími daty  
        #Vysegmentovaná páteř a detekce BB      
        #train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet.nii.gz")[0]    
        train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
        curr = join(base, t, 'Spine_labels/NN_Unet')        
        image_file = join(curr, train_spine_segm)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        nii_img=nii_img.astype(bool) # maska obratlu nnUNet binarne 
        
        min_coords, max_coords = get_3d_bounding_box(nii_img)  # nalezeni BB pro 3D     
        orig_size=nii_img.shape

        coordinates={'orig_size': orig_size, 'min_coords': min_coords,'max_coords': max_coords}    # uložení JSON souboru
        with open(join(crop_parameters_folder, t + ".json"), "w") as f:
            json.dump(coordinates, f, cls=NumpyArrayEncoder)
            
        
        
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        pom_seg_nn_unet_binar = nib.Nifti1Image(cut_nii_img, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagests, t + "_0001.nii.gz")) 
        
        #VMI 40keV
        vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
        curr = join(base, t, 'VMI')
        image_file = join(curr, vmi_40kev)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        pom_seg_nn_unet_binar = nib.Nifti1Image(cut_nii_img, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagests, t + "_0000.nii.gz")) 
        
        
        '''
        #konvenční CT
        train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
        curr = join(base, t, 'ConvCT_data_nifti')
        image_file = join(curr, train_patient_names)
        img = nib.load(image_file)
        nii_img=img.get_fdata()
        cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                      min_coords[1]:max_coords[1]+1,
                      min_coords[2]:max_coords[2]+1].copy()

        pom_seg_nn_unet_binar = nib.Nifti1Image(cut_nii_img, img.affine, img.header)
        nib.save(pom_seg_nn_unet_binar, join(imagests, t + "_0000.nii.gz")) 
        '''
        num_training_cases += 1    
    
    
    