# -*- coding: utf-8 -*-
"""
Created on Thu Aug  7 12:38:42 2025

@author: nohel
"""
import json
import os
join = os.path.join
from Functions.nnU_Net_preprocesing_functions import maybe_mkdir_p, subfiles, get_3d_bounding_box_padding, NumpyArrayEncoder, generate_dataset_json
import nibabel as nib
import shutil
import numpy as np 

if __name__ == "__main__":
    base = 'E:/Znaceni_dat/Data/'    
    # task_id = 708
    # version_name = "_all_together_zero_input_channel_convCT"
    # version_name = "_all_together_zero_input_channel_VMI40"
    # version_name = "_all_together_zero_input_channel_VMI80"
    # version_name = "_all_together_zero_input_channel_VMI120"
    # version_name = "_all_together_zero_input_channel_CaSupp_25"
    # version_name = "_all_together_zero_input_channel_CaSupp_50"
    # version_name = "_all_together_zero_input_channel_CaSupp_75"
    # version_name = "_all_together_zero_input_channel_CaSupp_100"
    
    
    # task_id = 717
    # version_name = "_all_VMI_zero_input_channel_VMI40"
    # version_name = "_all_VMI_zero_input_channel_VMI80"
    # version_name = "_all_VMI_zero_input_channel_VMI120"
    
    task_id = 718
    # version_name = "_all_CaSupp_zero_input_channel_CaSupp_25"
    # version_name = "_all_CaSupp_zero_input_channel_CaSupp_50"
    # version_name = "_all_CaSupp_zero_input_channel_CaSupp_75"
    version_name = "_all_CaSupp_zero_input_channel_CaSupp_100"
    
    
    
    task_name = "MM_Lesion_seg" + version_name           
    foldername = "Dataset%03.0d_%s" % (task_id, task_name)    
    out_base = join('E://nnUNet_v2_MAIN_FILE/nnUNet_raw/MM_Data_for_input_analysis', foldername)  
    maybe_mkdir_p(out_base)
    
    json_path = 'E:/Znaceni_dat/splits_final.json'
    with open(json_path, 'r') as f:
        folds = json.load(f)        
    
    for i, fold in enumerate(folds):
        fold_dir = os.path.join(out_base, f'fold_{i}')
        maybe_mkdir_p(fold_dir)
        
        imagests = join(fold_dir, "imagesTs")
        labelsts = join(fold_dir, "labelsTs")      
        crop_parameters_folder = join(fold_dir, "crop_parameters")         
        maybe_mkdir_p(imagests)
        maybe_mkdir_p(labelsts)    
        maybe_mkdir_p(crop_parameters_folder)         
        num_training_cases = 0
        
        # Kopírování pouze validačních pacientů
        for t in fold['val']:
            # Load nifti info from ConvCT for saving all patients
            train_patient_names=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
            curr = join(base, t, 'ConvCT_data_nifti')
            image_file = join(curr, train_patient_names)
            nifti_info_for_all = nib.load(image_file)
            #%%  
            #Load segmentation of spine and creation of BB      
            train_spine_segm = subfiles(join(base, t, 'Spine_labels/NN_Unet'), join=False, suffix="spine_seg_nnUNet_cor.nii.gz")[0]    
            curr = join(base, t, 'Spine_labels/NN_Unet')        
            image_file = join(curr, train_spine_segm)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            nii_img=nii_img.astype(bool) # vertebrae mask from nnUNet binary 
            
            padding = 5 
            min_coords, max_coords = get_3d_bounding_box_padding(nii_img, padding)  # creation of BB for 3D 
            
            orig_size=nii_img.shape
            
            coordinates={'orig_size': orig_size, 'min_coords': min_coords,'max_coords': max_coords}   # uložení JSON souboru
            with open(join(crop_parameters_folder, t + ".json"), "w") as f:
                json.dump(coordinates, f, cls=NumpyArrayEncoder)                
                
            # creation of crop spine seg mask
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()
            
            aux_var_spine_seg_nn_unet = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)

            #%% Preparation of input data
            # conventional CT 
            # conv_CT=subfiles(join(base, t, 'ConvCT_data_nifti'), join=False, suffix=".nii.gz")[0]
            # curr = join(base, t, 'ConvCT_data_nifti')
            # image_file = join(curr, conv_CT)
            # img = nib.load(image_file)
            # nii_img=img.get_fdata()
            # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
            #               min_coords[1]:max_coords[1]+1,
            #               min_coords[2]:max_coords[2]+1].copy()

            # aux_var_ConvCT = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            # #VMI 40keV
            # vmi_40kev=subfiles(join(base, t, 'VMI'), join=False, suffix="40kev.nii.gz")[0] 
            # curr = join(base, t, 'VMI')
            # image_file = join(curr, vmi_40kev)
            # img = nib.load(image_file)
            # nii_img=img.get_fdata()
            # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
            #               min_coords[1]:max_coords[1]+1,
            #               min_coords[2]:max_coords[2]+1].copy()

            # aux_var_vmi_40kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            # #VMI 80keV
            # vmi_80kev=subfiles(join(base, t, 'VMI'), join=False, suffix="80kev.nii.gz")[0] 
            # curr = join(base, t, 'VMI')
            # image_file = join(curr, vmi_80kev)
            # img = nib.load(image_file)
            # nii_img=img.get_fdata()
            # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
            #               min_coords[1]:max_coords[1]+1,
            #               min_coords[2]:max_coords[2]+1].copy()

            # aux_var_vmi_80kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            # #VMI 120keV
            # vmi_120kev=subfiles(join(base, t, 'VMI'), join=False, suffix="120kev.nii.gz")[0] 
            # curr = join(base, t, 'VMI')
            # image_file = join(curr, vmi_120kev)
            # img = nib.load(image_file)
            # nii_img=img.get_fdata()
            # cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
            #               min_coords[1]:max_coords[1]+1,
            #               min_coords[2]:max_coords[2]+1].copy()

            # aux_var_vmi_120kev = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            #CaSupp 25
            CaSupp_25=subfiles(join(base, t, 'CaSupp'), join=False, suffix="25.nii.gz")[0] 
            curr = join(base, t, 'CaSupp')
            image_file = join(curr, CaSupp_25)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()

            aux_var_CaSupp_25 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            #CaSupp 50
            CaSupp_50=subfiles(join(base, t, 'CaSupp'), join=False, suffix="50.nii.gz")[0] 
            curr = join(base, t, 'CaSupp')
            image_file = join(curr, CaSupp_50)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()

            aux_var_CaSupp_50 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            #CaSupp 75
            CaSupp_75=subfiles(join(base, t, 'CaSupp'), join=False, suffix="75.nii.gz")[0] 
            curr = join(base, t, 'CaSupp')
            image_file = join(curr, CaSupp_75)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()

            aux_var_CaSupp_75 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            #CaSupp 100
            CaSupp_100=subfiles(join(base, t, 'CaSupp'), join=False, suffix="100.nii.gz")[0] 
            curr = join(base, t, 'CaSupp')
            image_file = join(curr, CaSupp_100)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()

            aux_var_CaSupp_100 = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)

            #%%
            #labelstr - folder with anotations
            lesions_seg_GT= subfiles(join(base, t, 'Lesion_labels'), join=False, suffix="validation_VV_final.nii.gz")[0]    
            curr = join(base, t, 'Lesion_labels')
            image_file = join(curr, lesions_seg_GT)
            img = nib.load(image_file)
            nii_img=img.get_fdata()
            
            nii_img=nii_img.astype(bool) # maska lezi binarne 
            
            cut_nii_img = nii_img[min_coords[0]:max_coords[0]+1,
                          min_coords[1]:max_coords[1]+1,
                          min_coords[2]:max_coords[2]+1].copy()

            aux_var_lesions_seg_GT = nib.Nifti1Image(cut_nii_img, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            num_training_cases += 1 
            
            #%% Saving of dataset 
            #saving of labels
            nib.save(aux_var_lesions_seg_GT, join(labelsts, t + ".nii.gz")) 
            
            #%% saving of input data          
            
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_convCT 
        #     aux_nii_img=aux_var_ConvCT.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_zeros, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "aux_var_zeros",1: "VMI_40",2: "VMI_80",3: "VMI_120",4: "CaSupp_25",5: "CaSupp_50",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_VMI40 
        #     aux_nii_img=aux_var_vmi_40kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "aux_var_zeros",2: "VMI_80",3: "VMI_120",4: "CaSupp_25",5: "CaSupp_50",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
    
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_VMI80
        #     aux_nii_img=aux_var_vmi_80kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "aux_var_zeros",3: "VMI_120",4: "CaSupp_25",5: "CaSupp_50",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
            
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_VMI120
        #     aux_nii_img=aux_var_vmi_120kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "VMI_80",3: "aux_var_zeros",4: "CaSupp_25",5: "CaSupp_50",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
    
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_CaSupp_25
        #     aux_nii_img=aux_var_CaSupp_25.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_zeros, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "VMI_80",3: "VMI_120",4: "aux_var_zeros",5: "CaSupp_50",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_CaSupp_50
        #     aux_nii_img=aux_var_CaSupp_50.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "VMI_80",3: "VMI_120",4: "CaSupp_25",5: "aux_var_zeros",6: "CaSupp_75",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
        
        
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_CaSupp_75
        #     aux_nii_img=aux_var_CaSupp_75.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "VMI_80",3: "VMI_120",4: "CaSupp_25",5: "CaSupp_50",6: "aux_var_zeros",7: "CaSupp_100",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset708_MM_Lesion_seg_all_together_zero_input_channel_CaSupp_100
        #     aux_nii_img=aux_var_CaSupp_100.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_ConvCT, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0003.nii.gz"))
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0004.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0005.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0006.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0007.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0008.nii.gz"))  # Spine segmentation
             
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "ConvCT",1: "VMI_40",2: "VMI_80",3: "VMI_120",4: "CaSupp_25",5: "CaSupp_50",6: "CaSupp_75",7: "aux_var_zeros",8: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
        
        #%% 
        
        
        
        
        
        
            # %% Dataset717_MM_Lesion_seg_all_VMI_zero_input_channel_VMI40
        #     aux_nii_img=aux_var_vmi_40kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_zeros, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0003.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "aux_var_zeros",1: "VMI_80",2: "VMI_120",3: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset717_MM_Lesion_seg_all_VMI_zero_input_channel_VMI80
        #     aux_nii_img=aux_var_vmi_80kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_vmi_120kev, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0003.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "VMI_40",1: "aux_var_zeros",2: "VMI_120",3: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset717_MM_Lesion_seg_all_VMI_zero_input_channel_VMI120
        #     aux_nii_img=aux_var_vmi_120kev.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_vmi_40kev, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_vmi_80kev, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0003.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "VMI_40",1: "VMI_80",2: "aux_var_zeros",3: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            #%%
        
        
        
        
        
        
        
            # %% Dataset718_MM_Lesion_seg_all_CaSupp_zero_input_channel_CaSupp_25
        #     aux_nii_img=aux_var_CaSupp_25.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_zeros, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0003.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0004.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "aux_var_zeros",1: "CaSupp_50",2: "CaSupp_75",3: "CaSupp_100",4: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset718_MM_Lesion_seg_all_CaSupp_zero_input_channel_CaSupp_50
        #     aux_nii_img=aux_var_CaSupp_50.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_CaSupp_75, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0003.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0004.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "CaSupp_25",1: "aux_var_zeros",2: "CaSupp_75",3: "CaSupp_100",4: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset718_MM_Lesion_seg_all_CaSupp_zero_input_channel_CaSupp_75
        #     aux_nii_img=aux_var_CaSupp_75.get_fdata()
        #     zero_matrix = np.zeros_like(aux_nii_img)
        #     aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
        #     nib.save(aux_var_CaSupp_25, join(imagests, t + "_0000.nii.gz")) 
        #     nib.save(aux_var_CaSupp_50, join(imagests, t + "_0001.nii.gz")) 
        #     nib.save(aux_var_zeros, join(imagests, t + "_0002.nii.gz")) 
        #     nib.save(aux_var_CaSupp_100, join(imagests, t + "_0003.nii.gz")) 
        #     nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0004.nii.gz"))  # Spine segmentation         
        # generate_dataset_json(output_folder=fold_dir,
        #                       name = task_name,
        #                       channel_names={0: "CaSupp_25",1: "CaSupp_50",2: "aux_var_zeros",3: "CaSupp_100",4: "mask_spine", },
        #                       labels={"background": 0,"Lesions": 1,},
        #                       file_ending=".nii.gz",
        #                       num_training_cases=num_training_cases,)
        
            # %% Dataset718_MM_Lesion_seg_all_CaSupp_zero_input_channel_CaSupp_100
            aux_nii_img=aux_var_CaSupp_100.get_fdata()
            zero_matrix = np.zeros_like(aux_nii_img)
            aux_var_zeros = nib.Nifti1Image(zero_matrix, nifti_info_for_all.affine, nifti_info_for_all.header)
            
            nib.save(aux_var_CaSupp_25, join(imagests, t + "_0000.nii.gz")) 
            nib.save(aux_var_CaSupp_50, join(imagests, t + "_0001.nii.gz")) 
            nib.save(aux_var_CaSupp_75, join(imagests, t + "_0002.nii.gz")) 
            nib.save(aux_var_zeros, join(imagests, t + "_0003.nii.gz")) 
            nib.save(aux_var_spine_seg_nn_unet, join(imagests, t + "_0004.nii.gz"))  # Spine segmentation         
        generate_dataset_json(output_folder=fold_dir,
                              name = task_name,
                              channel_names={0: "CaSupp_25",1: "CaSupp_50",2: "CaSupp_75",3: "aux_var_zeros",4: "mask_spine", },
                              labels={"background": 0,"Lesions": 1,},
                              file_ending=".nii.gz",
                              num_training_cases=num_training_cases,)
        
        
        
        
        
        
        
        
        