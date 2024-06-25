function [DATA]=load_dicom_series(path_to_orig_data,patient)
collection = dicomCollection(path_to_orig_data);
% collection = sortrows(collection,'SeriesDescription')
%%
DATA=squeeze(dicomreadVolume(collection,'s1'));
DATA(:,:,:,2)=squeeze(dicomreadVolume(collection,'s2'));
DATA(:,:,:,3)=squeeze(dicomreadVolume(collection,'s3'));
DATA(:,:,:,4)=squeeze(dicomreadVolume(collection,'s4'));
DATA(:,:,:,5)=squeeze(dicomreadVolume(collection,'s5'));
DATA(:,:,:,6)=squeeze(dicomreadVolume(collection,'s6'));
DATA(:,:,:,7)=squeeze(dicomreadVolume(collection,'s7'));
DATA(:,:,:,8)=squeeze(dicomreadVolume(collection,'s8'));

% %% spine mask
% path_to_nn_unet_seg=[path_to_orig_data '\myel_' patient '_spine_seg_nnUNet_cor.nii.gz'];
% seg_nn_unet=niftiread(path_to_nn_unet_seg);
% seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","loose");
% %% lesion mask
% path_to_lesions=[path_to_orig_data '\myel_' patient '_lesions_seg_validation_VV_final.nii.gz'];
% seg_lesions=niftiread(path_to_lesions);
% seg_lesions=imrotate3(seg_lesions,90,[0 0 1],"nearest","loose");
% %%
% DATA(:,:,:,9)=seg_nn_unet;
% DATA(:,:,:,10)=seg_lesions;