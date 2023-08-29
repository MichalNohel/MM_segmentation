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

%%
orig3DroiVal.axi=zeros(size(segmentace));
