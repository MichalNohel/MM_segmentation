clear all
close all
clc
addpath Functions
path_to_database='E:\Znaceni_dat\Data';
%% Myel_001
patient='001';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_002
patient='002';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_003
patient='003';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_004 Problem s ulozenim nifti - v pythonu uděláno uložení
patient='004';
save_nifti=0;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_005 
patient='005';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_006 
patient='006';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_007 
patient='007';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_008
patient='008';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_009
patient='009';
save_nifti=1;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
%% Myel_010 Problem s ulozenim nifti - v pythonu uděláno uložení
patient='010';
save_nifti=0;
convert_nrrd2nifti_function(path_to_database,patient,save_nifti)






%% Myel_001
% patient='004'
% V = nrrdread(['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final.nrrd']);
% 
% path_to_orig_data=['C:\Users\nohel\Desktop\Záloha_segmentace\myel_' patient '_monoe_40kev.nii.gz'];
% 
% %%přímo z nrrd nifti
% % data=niftiread(path_to_orig_data);
% % info.Datatype = 'uint16';
% 
% %% přečíslování
% L = bwlabeln(V);
% L(L>0)=L(L>0)+1000;
% info=niftiinfo(path_to_orig_data);
% info.Datatype = 'double';
% 
% imfuse5(data,V)
% niftiwrite(L,['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_semantic'],info,Compressed=true);
% %% logical
% V_log=logical(L);
% info.Datatype = 'logical';
% niftiwrite(V_log,['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_logical'],info,Compressed=true);
% disp('hotovo')



