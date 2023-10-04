# -*- coding: utf-8 -*-
"""
Created on Mon Jul 31 21:54:00 2023

@author: nohel
"""
from scipy.io import loadmat
import numpy as np
import nibabel as nib


#%% Myel_004 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='004';
pacient_ID='S2470';
Conv_sken='S203970';
#%%
Leze_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels\Spine_analyzer/Leze_Spine_analyzer_final.mat')
Leze_Spine_analyzer_final=Leze_Spine_analyzer_final.get('Leze_Spine_analyzer_final')

maska_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels\Spine_analyzer/maska_Spine_analyzer_final.mat')
maska_Spine_analyzer_final=maska_Spine_analyzer_final.get('maska_Spine_analyzer_final')

seg_nn_unet_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels/NN_unet/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')

#%%
img = nib.load('E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels\Payer\Payer_20397_myel_' + pacient +'_spine.nii.gz')

#%% maska obratlu SA
pom_maska_Spine_analyzer_final = nib.Nifti1Image(maska_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_maska_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels\Spine_analyzer\Spine_analyzer_20397_myel_' + pacient +'_spine.nii.gz')

#%% leze
pom_Leze_Spine_analyzer_final = nib.Nifti1Image(Leze_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_Leze_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA.nii.gz')

#%% maska obratlu nnUNet
pom_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels/NN_Unet/nnUNet_20397_myel_' + pacient +'_spine.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Lesion_labels\Myel_' + pacient +'_lesions_nnUNet_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_nnUNet_semantic.nii.gz')
#%%%%





#%% Myel_010 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='010';
pacient_ID='S55480';
Conv_sken='S201320';
#%%
Leze_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels\Spine_analyzer/Leze_Spine_analyzer_final.mat')
Leze_Spine_analyzer_final=Leze_Spine_analyzer_final.get('Leze_Spine_analyzer_final')

maska_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels\Spine_analyzer/maska_Spine_analyzer_final.mat')
maska_Spine_analyzer_final=maska_Spine_analyzer_final.get('maska_Spine_analyzer_final')

seg_nn_unet_final=loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Spine_labels/NN_unet/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')


#%%
img = nib.load('E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels\Payer\Payer_20132_myel_' + pacient +'_spine.nii.gz')

#%% maska obratlu
pom_maska_Spine_analyzer_final = nib.Nifti1Image(maska_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_maska_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels\Spine_analyzer\Spine_analyzer_20132_myel_' + pacient +'_spine.nii.gz')

#%% leze
pom_Leze_Spine_analyzer_final = nib.Nifti1Image(Leze_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_Leze_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA.nii.gz')

#%% maska obratlu nnUNet
pom_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Spine_labels/NN_Unet/nnUNet_20132_myel_' + pacient +'_spine.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat('E:\Znaceni_dat\Data\Myel_'+pacient+'\Lesion_labels\Myel_' + pacient +'_lesions_nnUNet_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, 'E:\Znaceni_dat\Data\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_nnUNet_semantic.nii.gz')



#%%

'Healthy'

#%% Healthy_005 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='005';
pacient_ID='S14080';
Conv_sken='S202970';
#%%
Leze_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels\Spine_analyzer/Leze_Spine_analyzer_final.mat')
Leze_Spine_analyzer_final=Leze_Spine_analyzer_final.get('Leze_Spine_analyzer_final')

maska_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels\Spine_analyzer/maska_Spine_analyzer_final.mat')
maska_Spine_analyzer_final=maska_Spine_analyzer_final.get('maska_Spine_analyzer_final')

seg_nn_unet_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels/NN_unet/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load('E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Payer\Payer_20297_healthy_' + pacient +'_spine.nii.gz')

#%% maska obratlu
pom_maska_Spine_analyzer_final = nib.Nifti1Image(maska_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_maska_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Spine_analyzer\Spine_analyzer_20297_healthy_' + pacient +'_spine.nii.gz')

#%% leze
pom_Leze_Spine_analyzer_final = nib.Nifti1Image(Leze_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_Leze_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Lesion_labels\Healthy_' + pacient +'_lesions_SA.nii.gz')

#%% maska obratlu nnUNet
pom_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels/NN_Unet/nnUNet_20297_healthy_' + pacient +'_spine.nii.gz')


#%% Healthy_010 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='010';
pacient_ID='S12760';
Conv_sken='S203930';
#%%

Leze_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels\Spine_analyzer/Leze_Spine_analyzer_final.mat')
Leze_Spine_analyzer_final=Leze_Spine_analyzer_final.get('Leze_Spine_analyzer_final')

maska_Spine_analyzer_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels\Spine_analyzer/maska_Spine_analyzer_final.mat')
maska_Spine_analyzer_final=maska_Spine_analyzer_final.get('maska_Spine_analyzer_final')

seg_nn_unet_final=loadmat('E:\Znaceni_dat\Data\Healthy_'+pacient+'\Spine_labels/NN_unet/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')


#%%
img = nib.load('E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Payer\Payer_20393_healthy_' + pacient +'_spine.nii.gz')

#%% maska obratlu
pom_maska_Spine_analyzer_final = nib.Nifti1Image(maska_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_maska_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Spine_analyzer\Spine_analyzer_20393_healthy_' + pacient +'_spine.nii.gz')

#%% leze
pom_Leze_Spine_analyzer_final = nib.Nifti1Image(Leze_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_Leze_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Lesion_labels\Healthy_' + pacient +'_lesions_SA.nii.gz')

#%% maska obratlu nnUNet
pom_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels/NN_Unet/nnUNet_20393_healthy_' + pacient +'_spine.nii.gz')


