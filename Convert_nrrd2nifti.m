clear all
close all
clc
addpath Functions
path_to_database='E:\Znaceni_dat\Data';
%%

%% Myel_001
patient='001'
V = nrrdread(['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final.nrrd']);

path_to_orig_data=['C:\Users\nohel\Desktop\Záloha_segmentace\myel_' patient '_monoe_40kev.nii.gz'];

%%přímo z nrrd nifti
% data=niftiread(path_to_orig_data);
% info.Datatype = 'uint16';

%% přečíslování
L = bwlabeln(V);
L(L>0)=L(L>0)+1000;
info=niftiinfo(path_to_orig_data);
info.Datatype = 'double';

% imfuse5(data,V)
niftiwrite(L,['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_semantic'],info,Compressed=true);
%% logical
V_log=logical(L);
info.Datatype = 'logical';
niftiwrite(V_log,['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_logical'],info,Compressed=true);
disp('hotovo')



