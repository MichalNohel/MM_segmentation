# -*- coding: utf-8 -*-
"""
Created on Mon Mar  4 11:52:11 2024

@author: nohel
"""
import nibabel as nib

pacient='005';
path_to_database='E:\Znaceni_dat\Data_pom';


img_konv = nib.load(path_to_database + '\Myel_' + pacient +'\ConvCT_data_nifti\myel_' + pacient +'_konv.nii.gz')

img_ca_25= nib.load(path_to_database + '\Myel_' + pacient +'\CaSupp_data_nifti\myel_' + pacient +'_CaSupp_25.nii.gz')

img_ca_25_data=img_ca_25.get_fdata()


TMP_img_ca_25 = nib.Nifti1Image(img_ca_25_data, img_konv.affine, img_konv.header)
nib.save(TMP_img_ca_25, path_to_database + '\Myel_' + pacient +'\CaSupp_data_nifti\myel_' + pacient +'_CaSupp_25_ver2.nii.gz')
