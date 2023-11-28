function []=create_semantic_segmentation(path_to_database,patient,save_nifti, version_of_nnUNet)
% Orig data
path_to_orig_data=[path_to_database '\Myel_' patient '\ConvCT_data_nifti\myel_' patient '_konv.nii.gz'];

data=niftiread(path_to_orig_data);
% Lesions
path_to_lesions=[path_to_database '\Myel_' patient '\Lesion_labels\Myel_' patient '_lesions_seg_nnUNet_' version_of_nnUNet '.nii.gz'];

seg_lesions=niftiread(path_to_lesions);
L = bwlabeln(seg_lesions);
L(L>0)=L(L>0)+1000;
imfuse5(data, L)
info=niftiinfo(path_to_lesions);
info.Datatype = 'double';
if (save_nifti==1)
    niftiwrite(L,[path_to_database '\Myel_' patient '\Lesion_labels\Myel_' patient '_lesions_seg_nnUNet_' version_of_nnUNet '_semantic'],info,Compressed=true);
else
    save([path_to_database '\Myel_' patient '\TMP\Myel_' patient '_lesions_seg_nnUNet_' version_of_nnUNet '_semantic.mat'],'L')
end