clear all
close all
clc
addpath Functions

%% Myel_001
clear all
close all
clc
%% MASKA
pacient='001';
pacient_ID='S80060';
Conv_sken='S207640';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
% clear OutputSA;
%% Info pro vytvoření Nifti
%info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Payer\20764_myel_' pacient '_konv_seg_modified.nii.gz']);
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20764_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20764_myel_' pacient '_spine.nii.gz'],info,Compressed=true);

%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii'],info,Compressed=true);

%% Myel_002
clear all
close all
clc
%% MASKA
pacient='002';
pacient_ID='S84960';
Conv_sken='S204140'
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20414_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20414_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii'],info,Compressed=true);


%% Myel_003
clear all
close all
clc
%% MASKA
pacient='003';
pacient_ID='S98240';
Conv_sken='S204340'
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20434_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20434_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA.nii'],info,Compressed=true);


%% Myel_004 - problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
clear all
close all
clc
%% MASKA
pacient='004';
pacient_ID='S2470';
Conv_sken='S203970';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;

%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));

%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));

%% Oprava orientace nnUNetu 
%nerotovany vystup z nnUNetu 
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\20397_myel_004_konv.nii.gz']; 
seg_nn_unet=niftiread(path_to_nn_unet_seg);
seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","crop");
seg_nn_unet_rot=seg_nn_unet(:,end:-1:1,:);
imfuse5(data,seg_nn_unet_rot)
seg_nn_unet_final=uint8(imrotate3(seg_nn_unet_rot,-90,[0 0 1],"nearest",'crop'));

%% Uložení mat filů
save("E:\Znaceni_dat\Data\Myel_004\Spine_labels\Spine_analyzer\maska_Spine_analyzer_final.mat","maska_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Myel_004\Spine_labels\Spine_analyzer\Leze_Spine_analyzer_final.mat","Leze_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Myel_004\Spine_labels\NN_unet\seg_nn_unet_final.mat","seg_nn_unet_final")


%% Myel_005
clear all
close all
clc
%% MASKA
pacient='005';
pacient_ID='S17160';
Conv_sken='S204910';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20491_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20491_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA'],info,Compressed=true);


%% Myel_006
clear all
close all
clc
%% MASKA
pacient='006';
pacient_ID='S32070';
Conv_sken='S204190';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20419_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20419_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA'],info,Compressed=true);


%% Myel_007
clear all
close all
clc
%% MASKA
pacient='007';
pacient_ID='S54240';
Conv_sken='S20100';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\2010_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_2010_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA'],info,Compressed=true);

%% Myel_008
clear all
close all
clc
%% MASKA
pacient='008';
pacient_ID='S45700';
Conv_sken='S204140';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20414_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20414_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA'],info,Compressed=true);

%% Myel_009
clear all
close all
clc
%% MASKA
pacient='009';
pacient_ID='S31610';
Conv_sken='S203570';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Myel_' pacient '\ConvCT_data_nifti\20357_myel_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20357_myel_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Myel_' pacient '\Lesion_labels\Myel_' pacient '_lesions_SA'],info,Compressed=true);


%% Myel_010 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu
clear all
close all
clc
%% MASKA
pacient='010';
pacient_ID='S55480';
Conv_sken='S201320';
path_to_orig_data=['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% LÉZE
OutputSA_leze=load(['E:\ISP_Myelomy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));

%% Oprava orientace nnUNetu
%nerotovany vystup z nnUNetu
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Myel_' pacient '\Spine_labels\NN_unet\20132_myel_010_konv.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","crop");
seg_nn_unet_rot=seg_nn_unet(:,end:-1:1,:);
imfuse5(data,seg_nn_unet_rot)
seg_nn_unet_final=uint8(imrotate3(seg_nn_unet_rot,-90,[0 0 1],"nearest",'crop'));

%% Uložení mat filů
save("E:\Znaceni_dat\Data\Myel_010\Spine_labels\Spine_analyzer\maska_Spine_analyzer_final.mat","maska_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Myel_010\Spine_labels\Spine_analyzer\Leze_Spine_analyzer_final.mat","Leze_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Myel_010\Spine_labels\NN_unet\seg_nn_unet_final.mat","seg_nn_unet_final")
%% 




% HEALTHY!!!






%% Healthy_001
clear all
close all
clc
%% MASKA
pacient='001';
pacient_ID='S56430';
Conv_sken='S202980';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20298_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20298_healthy_' pacient '_spine'],info,Compressed=true);

%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);

%% Healthy_002
clear all
close all
clc
%% MASKA
pacient='002';
pacient_ID='S56310';
Conv_sken='S202120';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20212_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20212_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);

%% Healthy_003
clear all
close all
clc
%% MASKA
pacient='003';
pacient_ID='S36630';
Conv_sken='S202770';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20277_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20277_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);

%% Healthy_004
clear all
close all
clc
%% MASKA
pacient='004';
pacient_ID='S13780';
Conv_sken='S202570';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20257_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20257_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);

%% Healthy_005 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu
clear all
close all
clc
%% MASKA
pacient='005';
pacient_ID='S14080';
Conv_sken='S202970';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% Oprava orientace nnUNetu
%nerotovany vystup z nnUNetu
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\20297_healthy_005_konv.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","crop");
seg_nn_unet_rot=seg_nn_unet(:,end:-1:1,:);
imfuse5(data,seg_nn_unet_rot)
seg_nn_unet_final=uint8(imrotate3(seg_nn_unet_rot,-90,[0 0 1],"nearest",'crop'));

%% Uložení mat filů
save("E:\Znaceni_dat\Data\Healthy_005\Spine_labels\Spine_analyzer\maska_Spine_analyzer_final.mat","maska_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Healthy_005\Spine_labels\Spine_analyzer\Leze_Spine_analyzer_final.mat","Leze_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Healthy_005\Spine_labels\NN_unet\seg_nn_unet_final.mat","seg_nn_unet_final")


%% Healthy_006
clear all
close all
clc
%% MASKA
pacient='006';
pacient_ID='S56900';
Conv_sken='S202790';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20279_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20279_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);
%% Healthy_007
clear all
close all
clc
%% MASKA
pacient='007';
pacient_ID='S18030';
Conv_sken='S203630';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20363_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20363_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);
%% Healthy_008
clear all
close all
clc
%% MASKA
pacient='008';
pacient_ID='S55810';
Conv_sken='S204260';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20426_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20426_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);
%% Healthy_009
clear all
close all
clc
%% MASKA
pacient='009';
pacient_ID='S33290';
Conv_sken='S202770';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
% clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\20277_healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace(:,1:367,:);
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(maska_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\Spine_analyzer\Spine_analyzer_20277_healthy_' pacient '_spine'],info,Compressed=true);
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze(:,1:367,:);
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
niftiwrite(Leze_Spine_analyzer_final,['E:\Znaceni_dat\Data\Healthy_' pacient '\Lesion_labels\Healthy_' pacient '_lesions_SA'],info,Compressed=true);

%% Healthy_010 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu
clear all
close all
clc
%% MASKA
pacient='010';
pacient_ID='S12760';
Conv_sken='S203930';
path_to_orig_data=['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken ] % Načtení orig dat pro zobrazení
collection = dicomCollection(path_to_orig_data)
data=squeeze(dicomreadVolume(collection,'s1'));
OutputSA=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace=OutputSA.Data.orig3DroiSeg;
pozice=OutputSA.Data.positions_orig;
orig_rozmery=OutputSA.info.size_orig;
clear OutputSA;
%% Info pro vytvoření Nifti
info=niftiinfo(['E:\Znaceni_dat\Data\Healthy_' pacient '\ConvCT_data_nifti\healthy_' pacient '_konv.nii.gz']);
info.Description = 'Modified using MATLAB R2022b';
info.Datatype = 'uint8';
info.BitsPerPixel = '8';
%% MASKA OBRATLU
maska_Spine_analyzer=zeros(orig_rozmery);
maska_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace;
maska_Spine_analyzer_rot=imrotate3(maska_Spine_analyzer,180,[0 1 0],"nearest",'crop');
maska_Spine_analyzer_rot=maska_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,maska_Spine_analyzer_rot)
maska_Spine_analyzer_final=uint8(imrotate3(maska_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% LÉZE
OutputSA_leze=load(['E:\ISP_Healthy_export\' pacient_ID '\' Conv_sken '\Results\' Conv_sken '_validated.mat']); % Načtení Masek ze SpineAnalyzeru
segmentace_leze=OutputSA_leze.orig3DroiVal.axi;  
Leze_Spine_analyzer=zeros(orig_rozmery);
Leze_Spine_analyzer(pozice(1):pozice(2),pozice(3):pozice(4),pozice(5):pozice(6))=segmentace_leze;
Leze_Spine_analyzer_rot=imrotate3(Leze_Spine_analyzer,180,[0 1 0],"nearest",'crop');
Leze_Spine_analyzer_rot=Leze_Spine_analyzer_rot(:,end:-1:1,:);
imfuse5(data,Leze_Spine_analyzer_rot)
Leze_Spine_analyzer_final=uint8(imrotate3(Leze_Spine_analyzer_rot,-90,[0 0 1],"nearest",'crop'));
%% Oprava orientace nnUNetu
%nerotovany vystup z nnUNetu
path_to_nn_unet_seg=['E:\Znaceni_dat\Data\Healthy_' pacient '\Spine_labels\NN_unet\20393_healthy_010_konv.nii.gz'];
seg_nn_unet=niftiread(path_to_nn_unet_seg);
seg_nn_unet=imrotate3(seg_nn_unet,90,[0 0 1],"nearest","crop");
seg_nn_unet_rot=seg_nn_unet(:,end:-1:1,:);
imfuse5(data,seg_nn_unet_rot)
seg_nn_unet_final=uint8(imrotate3(seg_nn_unet_rot,-90,[0 0 1],"nearest",'crop'));
%% Uložení mat filů
save("E:\Znaceni_dat\Data\Healthy_010\Spine_labels\Spine_analyzer\maska_Spine_analyzer_final.mat","maska_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Healthy_010\Spine_labels\Spine_analyzer\Leze_Spine_analyzer_final.mat","Leze_Spine_analyzer_final")
save("E:\Znaceni_dat\Data\Healthy_010\Spine_labels\NN_unet\seg_nn_unet_final.mat","seg_nn_unet_final")







