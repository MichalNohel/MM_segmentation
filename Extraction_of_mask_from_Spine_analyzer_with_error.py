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
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')
#%%%%





#%% Myel_010 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='010';
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')


#%% Myel_021 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='021';
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')



#%% Myel_024 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='024';
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')



#%% Myel_029 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='029';
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')


#%% Myel_031 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='031';
path_to_database='E:\Znaceni_dat\Data';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')

#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')


#%% Myel_042 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='042';
path_to_database='E:\Znaceni_dat\Data_pom';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')


#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')


#%% Myel_050 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='050';
path_to_database='E:\Znaceni_dat\Data_pom';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')


#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')



#%% Myel_060 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='060';
path_to_database='E:\Znaceni_dat\Data_pom';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')


#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')


#%% Myel_072 - problém převodu dicom2nifit - bylo potřeba upravit dicom info
pacient='072';
path_to_database='E:\Znaceni_dat\Data_pom';
version_of_nnUNet='v_1_0';
version_of_SA='v_4_3';
#%%
Spine_mask_Spine_analyzer_final=loadmat( path_to_database + '\Myel_'+pacient+'\TMP/Spine_mask_Spine_analyzer_final.mat')
Spine_mask_Spine_analyzer_final=Spine_mask_Spine_analyzer_final.get('Spine_mask_Spine_analyzer_final')

Lesion_mask_Spine_analyzer_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Lesion_mask_Spine_analyzer_final.mat')
Lesion_mask_Spine_analyzer_final=Lesion_mask_Spine_analyzer_final.get('Lesion_mask_Spine_analyzer_final')

seg_nn_unet_final=loadmat(path_to_database + '\Myel_'+pacient+'\TMP/seg_nn_unet_final.mat')
seg_nn_unet_final=seg_nn_unet_final.get('seg_nn_unet_final')
#%%
img = nib.load(path_to_database + '\Myel_' + pacient +'\Spine_labels\Payer\myel_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu SA
TMP_Spine_mask_Spine_analyzer_final = nib.Nifti1Image(Spine_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Spine_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Spine_labels\Spine_analyzer\myel_' + pacient +'_spine_seg_SA_' + version_of_SA + '.nii.gz')

#%% leze
TMP_Lesion_mask_Spine_analyzer_final = nib.Nifti1Image(Lesion_mask_Spine_analyzer_final, img.affine, img.header)
nib.save(TMP_Lesion_mask_Spine_analyzer_final, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_SA_' + version_of_SA + '.nii.gz')

#%% maska obratlu nnUNet
TMP_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(TMP_seg_nn_unet_final, path_to_database + '\Myel_' + pacient +'\Spine_labels/NN_Unet/myel_' + pacient +'_spine_seg_nnUNet.nii.gz')


#%% Vytvoření semantické segmentace lézí z nnUNetu
leze_nnUNet = loadmat(path_to_database + '\Myel_'+pacient+'\TMP\Myel_' + pacient +'_lesions_seg_nnUNet_' + version_of_nnUNet + '_semantic.mat')
leze_nnUNet=leze_nnUNet.get('L')
pom_leze_nnUNet = nib.Nifti1Image(leze_nnUNet, img.affine, img.header)
nib.save(pom_leze_nnUNet, path_to_database + '\Myel_' + pacient +'\Lesion_labels\Myel_' + pacient +'_lesions_seg_nnUNet_'+ version_of_nnUNet +'_semantic.nii.gz')




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
img = nib.load('E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Payer\healthy_' + pacient +'_spine_seg_Payer.nii.gz')

#%% maska obratlu
pom_maska_Spine_analyzer_final = nib.Nifti1Image(maska_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_maska_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels\Spine_analyzer\Spine_analyzer_20297_healthy_' + pacient +'_spine.nii.gz')

#%% leze
pom_Leze_Spine_analyzer_final = nib.Nifti1Image(Leze_Spine_analyzer_final, img.affine, img.header)
nib.save(pom_Leze_Spine_analyzer_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Lesion_labels\Healthy_' + pacient +'_lesions_SA.nii.gz')

#%% maska obratlu nnUNet
pom_seg_nn_unet_final = nib.Nifti1Image(seg_nn_unet_final, img.affine, img.header)
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels/NN_Unet/healthy_' + pacient +'_spine_seg_nnUNet.nii.gz')


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
nib.save(pom_seg_nn_unet_final, 'E:\Znaceni_dat\Data\Healthy_' + pacient +'\Spine_labels/NN_Unet/healthy_' + pacient +'_spine_seg_nnUNet.nii.gz')


