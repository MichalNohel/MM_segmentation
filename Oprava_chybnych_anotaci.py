# -*- coding: utf-8 -*-
"""
Created on Mon Mar  4 11:52:11 2024

@author: nohel
"""
import nibabel as nib
import numpy as np
#%%
pacient='014';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==15]=14
segm_data[segm_data==16]=15
segm_data[segm_data==17]=16
segm_data[segm_data==18]=17
segm_data[segm_data==19]=18
segm_data[segm_data==20]=19

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='031';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==23]=22
segm_data[segm_data==24]=23
segm_data[segm_data==25]=24

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='043';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==14]=15
segm_data[segm_data==13]=14
segm_data[segm_data==12]=13
segm_data[segm_data==11]=12
segm_data[segm_data==10]=11
segm_data[segm_data==9]=10

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='044';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==23]=22
segm_data[segm_data==24]=23
segm_data[segm_data==25]=24

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='045';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==12]=11
segm_data[segm_data==13]=12

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')


#%%
pacient='052';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==15]=14
segm_data[segm_data==16]=15
segm_data[segm_data==17]=16
segm_data[segm_data==18]=17
segm_data[segm_data==19]=18
segm_data[segm_data==20]=19
segm_data[segm_data==21]=20
segm_data[segm_data==22]=21
segm_data[segm_data==25]=24
segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')


#%%
pacient='059';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==15]=16
segm_data[segm_data==14]=15
segm_data[segm_data==13]=14
segm_data[segm_data==12]=13

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='062';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==22]=21
segm_data[segm_data==23]=22
segm_data[segm_data==24]=23
segm_data[segm_data==25]=24

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='063';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==14]=13
segm_data[segm_data==15]=14
segm_data[segm_data==16]=15
segm_data[segm_data==17]=16
segm_data[segm_data==18]=17
segm_data[segm_data==25]=24

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='070';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==16]=15
segm_data[segm_data==17]=16
segm_data[segm_data==18]=17
segm_data[segm_data==19]=18
segm_data[segm_data==20]=19
segm_data[segm_data==21]=20
segm_data[segm_data==22]=21
segm_data[segm_data==25]=24

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='071';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==19]=20
segm_data[segm_data==18]=19

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='077';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==20]=21
segm_data[segm_data==19]=20

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='081';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())

segm_data[segm_data==16]=15
segm_data[segm_data==17]=16
segm_data[segm_data==18]=17
segm_data[segm_data==19]=18
segm_data[segm_data==20]=19
segm_data[segm_data==21]=20
segm_data[segm_data==22]=21
segm_data[segm_data==23]=22
segm_data[segm_data==24]=23
segm_data[segm_data==25]=24
segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')

#%%
pacient='066';
path_to_database='E:\Znaceni_dat\Data';

segm = nib.load(path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor.nii.gz')
segm_data=np.uint8(segm.get_fdata())


segm_data[segm_data==20]=19

segm_data_oprava = nib.Nifti1Image(segm_data, segm.affine, segm.header)
nib.save(segm_data_oprava, path_to_database + '\Myel_' + pacient +'/Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet_cor_final.nii.gz')















