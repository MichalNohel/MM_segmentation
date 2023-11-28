function []=extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA)
% Orig data
% path_to_orig_data=[path_to_database '\Myel_' patient '\ConvCT_data_dicom\']; % Načtení orig dat pro zobrazení
% collection = dicomCollection(path_to_orig_data);
% data=squeeze(dicomreadVolume(collection,'s1'));
% Output from SA 
OutputSA=load([path_to_SA_results  '\Myel_' patient '\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentation_of_spine=OutputSA.Data.orig3DroiSeg;
positions_orig=OutputSA.Data.positions_orig;
size_orig=OutputSA.info.size_orig;
clear OutputSA;
%% Info for nifti creation
info=niftiinfo([path_to_database '\Myel_' patient '\ConvCT_data_nifti\myel_' patient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% Spine mask creation and rotation
Spine_mask_Spine_analyzer=zeros(size_orig);
Spine_mask_Spine_analyzer(positions_orig(1):positions_orig(2),positions_orig(3):positions_orig(4),positions_orig(5):positions_orig(6))=segmentation_of_spine;
Spine_mask_Spine_analyzer_rot=imrotate3(Spine_mask_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Spine_mask_Spine_analyzer_rot=Spine_mask_Spine_analyzer_rot(:,end:-1:1,:);
% imfuse5(data,Spine_mask_Spine_analyzer_rot)
Spine_mask_Spine_analyzer_final=uint8(imrotate3(Spine_mask_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% Lesion mask creation and rotation
OutputSA_lesion=load([path_to_SA_results  '\Myel_' patient '\' Conv_sken '_validated.mat']); % Načtení "validovaných" lézí ze SpineAnalyzeru
segmention__of_lesion=OutputSA_lesion.orig3DroiVal.axi;  
Lesion_mask_Spine_analyzer=zeros(size_orig);
Lesion_mask_Spine_analyzer(positions_orig(1):positions_orig(2),positions_orig(3):positions_orig(4),positions_orig(5):positions_orig(6))=segmention__of_lesion;
Lesion_mask_Spine_analyzer_rot=imrotate3(Lesion_mask_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Lesion_mask_Spine_analyzer_rot=Lesion_mask_Spine_analyzer_rot(:,end:-1:1,:);
% imfuse5(data,Lesion_mask_Spine_analyzer_rot)
Lesion_mask_Spine_analyzer_final=uint8(imrotate3(Lesion_mask_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));

if (save_nifti==1)
    % save spine mask
    niftiwrite(Spine_mask_Spine_analyzer_final,[path_to_database '\Myel_' patient '\Spine_labels\Spine_analyzer\myel_' patient '_spine_seg_SA_' version_of_SA],info,Compressed=true);
    % save lesion mask
    niftiwrite(Lesion_mask_Spine_analyzer_final,[path_to_database '\Myel_' patient '\Lesion_labels\Myel_' patient '_lesions_SA_' version_of_SA],info,Compressed=true);
else  

    %% Oprava orientace nnUNetu 
    %nerotovany vystup z nnUNetu 
    path_to_nn_unet_seg=[path_to_database '\Myel_' patient '\TMP\myel_' patient '_spine_seg_nnUNet_non_rotated.nii.gz']; 
    seg_nn_unet=niftiread(path_to_nn_unet_seg);
    seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","crop");
    seg_nn_unet_rot=seg_nn_unet(:,end:-1:1,:);
%     imfuse5(data,seg_nn_unet_rot)
    seg_nn_unet_final=uint8(imrotate3(seg_nn_unet_rot,-90,[0 0 1],"nearest",'crop'));

    % Saving of mat files
    save([path_to_database '\Myel_' patient '\TMP\Spine_mask_Spine_analyzer_final.mat'],"Spine_mask_Spine_analyzer_final");
    save([path_to_database '\Myel_' patient '\TMP\Lesion_mask_Spine_analyzer_final.mat'],"Lesion_mask_Spine_analyzer_final");
    save([path_to_database '\Myel_' patient '\TMP\seg_nn_unet_final.mat'],"seg_nn_unet_final");
end


end



