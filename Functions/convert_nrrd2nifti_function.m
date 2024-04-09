function []=convert_nrrd2nifti_function(path_to_database,patient,save_nifti)
% Orig data
path_to_orig_data=[path_to_database '\Myel_' patient '\ConvCT_data_nifti\myel_' patient '_konv.nii.gz'];
data=niftiread(path_to_orig_data);
% Lesions
path_to_lesions=[path_to_database '\Myel_' patient '\Lesion_labels\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final.nrrd'];

seg_lesions=nrrdread(path_to_lesions);


%% přečíslování
L = bwlabeln(seg_lesions);
L(L>0)=L(L>0)+1000;
% imfuse5(data, L)
info=niftiinfo(path_to_orig_data);
info.Datatype = 'double';
if (save_nifti==1)
    niftiwrite(L,[path_to_database '\Myel_' patient '\Lesion_labels\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_semantic'],info,Compressed=true);
else
    save([path_to_database '\Myel_' patient '\TMP\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_semantic.mat'],'L')
end



% %% logical
% V_log=logical(L);
% info.Datatype = 'logical';
% niftiwrite(V_log,['C:\Users\nohel\Desktop\Záloha_segmentace\Myel_' patient '_lesions_seg_MITK_val_MN_cor_final_logical'],info,Compressed=true);
% disp('hotovo')
