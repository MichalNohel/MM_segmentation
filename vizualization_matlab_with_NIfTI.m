clear all
close all
clc
addpath Functions

%% Myel_001
pacient='001';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
% data=imrotate3(data,90,[0 0 1],"nearest","loose");
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
% seg_payer=imrotate3(seg_payer,90,[0 0 1],"nearest","loose");
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
% seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","loose");
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
% seg_spine_analyzer=imrotate3(seg_spine_analyzer,90,[0 0 1],"nearest","loose");
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];

seg_lesions=niftiread(path_to_lesions);
% seg_lesions=imrotate3(seg_lesions,90,[0 0 1],"nearest","loose");
%%
imfuse5(data, seg_lesions)
%% Myel_002
clear all
close all
clc
pacient='002';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_003
clear all
close all
clc
pacient='003';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)
%% Myel_004
clear all
close all
clc
pacient='004';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_005
clear all
close all
clc
pacient='005';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_006
clear all
close all
clc
pacient='006';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_007
clear all
close all
clc
pacient='007';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_008
clear all
close all
clc
pacient='008';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_009
clear all
close all
clc
pacient='009';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_010
clear all
close all
clc
pacient='010';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
% path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_validation_MN.nii.gz'];
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)
%% Myel_011
clear all
close all
clc
pacient='011';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_012
clear all
close all
clc
pacient='012';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_014
clear all
close all
clc
pacient='014';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_015
clear all
close all
clc
pacient='015';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_016
clear all
close all
clc
pacient='016';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_017
clear all
close all
clc
pacient='017';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_018
clear all
close all
clc
pacient='018';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_019
clear all
close all
clc
pacient='019';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_020
clear all
close all
clc
pacient='020';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_021
clear all
close all
clc
pacient='021';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_022
clear all
close all
clc
pacient='022';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_023
clear all
close all
clc
pacient='023';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_024
clear all
close all
clc
pacient='024';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_025
clear all
close all
clc
pacient='025';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_026
clear all
close all
clc
pacient='026';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_027
clear all
close all
clc
pacient='027';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_028
clear all
close all
clc
pacient='028';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_029
clear all
close all
clc
pacient='029';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_030
clear all
close all
clc
pacient='030';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_031
clear all
close all
clc
pacient='031';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_033
clear all
close all
clc
pacient='033';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_034
clear all
close all
clc
pacient='034';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_036
clear all
close all
clc
pacient='036';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_038
clear all
close all
clc
pacient='038';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_039
clear all
close all
clc
pacient='039';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_040
clear all
close all
clc
pacient='040';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\myel_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\myel_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\myel_' pacient '_spine_seg_SA_v_4_3.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA_v_4_3.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)
%% 





% HEALTHY!!!






%% Healthy_001
clear all
close all
clc
pacient='001';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_002
clear all
close all
clc
pacient='002';
Conv_sken_ID='20212';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_003
clear all
close all
clc
pacient='003';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_004
clear all
close all
clc
pacient='004';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_005
clear all
close all
clc
pacient='005';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_006
clear all
close all
clc
pacient='006';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_007
clear all
close all
clc
pacient='007';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_008
clear all
close all
clc
pacient='008';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_009
clear all
close all
clc
pacient='009';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Healthy_010
clear all
close all
clc
pacient='010';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\healthy_' pacient '_spine_seg_Payer.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\healthy_' pacient '_spine_seg_nnUNet.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\healthy_' pacient '_spine_seg_SA.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)












