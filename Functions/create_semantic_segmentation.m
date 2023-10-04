function []=create_semantic_segmentation(pacient,Conv_sken_ID,uloz_nifti)
path_to_orig_data=['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\' Conv_sken_ID '_myel_' pacient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
% Lesions
path_to_lesions=['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_nnUNet.nii.gz'];
seg_lesions=niftiread(path_to_lesions);
L = bwlabeln(seg_lesions);
L(L>0)=L(L>0)+1000;
imfuse5(data, L)
info=niftiinfo(path_to_lesions);
info.Datatype = 'double';
if (uloz_nifti==1)
    niftiwrite(L,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_nnUNet_semantic'],info,Compressed=true);
else
    save(['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_nnUNet_semantic.mat'],'L')
end