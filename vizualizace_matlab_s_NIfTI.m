clear all
close all
clc
addpath Functions

%% Myel_001
pacient='001';
Conv_sken_ID='20764';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
% data=imrotate3(data,90,[0 0 1],"nearest","loose");
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
% seg_payer=imrotate3(seg_payer,90,[0 0 1],"nearest","loose");
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
% seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","loose");
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
% seg_spine_analyzer=imrotate3(seg_spine_analyzer,90,[0 0 1],"nearest","loose");
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
% seg_lesions=imrotate3(seg_lesions,90,[0 0 1],"nearest","loose");
%%
imfuse5(data, seg_lesions)
%% Myel_002
clear all
close all
clc
pacient='002';
Conv_sken_ID='20414';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_003
clear all
close all
clc
pacient='003';
Conv_sken_ID='20434';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)
%% Myel_004
clear all
close all
clc
pacient='004';
Conv_sken_ID='20397';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_005
clear all
close all
clc
pacient='005';
Conv_sken_ID='20491';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_006
clear all
close all
clc
pacient='006';
Conv_sken_ID='20419';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_007
clear all
close all
clc
pacient='007';
Conv_sken_ID='2010';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_008
clear all
close all
clc
pacient='008';
Conv_sken_ID='20414';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_009
clear all
close all
clc
pacient='009';
Conv_sken_ID='20357';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
%%
imfuse5(data, seg_lesions)

%% Myel_010
clear all
close all
clc
pacient='010';
Conv_sken_ID='20132';
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_myel_' pacient '_spine.nii.gz'];
seg_spine_analyzer=niftiread(path_to_spine_analyzer_seg);
%%
imfuse5(data, seg_payer)
%%
imfuse5(data, seg_nn_unet)
%%
imfuse5(data, seg_spine_analyzer)
%% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii.gz'];
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
Conv_sken_ID='20298';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20277';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20257';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20297';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20279';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20363';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20426';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20277';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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
Conv_sken_ID='20393';
path_to_orig_data=['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_healthy_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
%%
path_to_Payer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Payer\Payer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_payer=niftiread(path_to_Payer_seg);
%%
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\nnUNet_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
%%
path_to_spine_analyzer_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_' Conv_sken_ID '_healthy_' pacient '_spine.nii.gz'];
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












