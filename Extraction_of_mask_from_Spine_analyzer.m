clear all
close all
clc
addpath Functions

%% Global parameters
path_to_database='E:\Znaceni_dat\Data';
path_to_SA_results='E:\Znaceni_dat\Vystup_Spine_Analyzer_v_4_3';
version_of_SA='v_4_3';

%% Myel_001
patient='001';
Conv_sken='S207640';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_002
patient='002';
Conv_sken='S204140';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_003
patient='003';
Conv_sken='S204340';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_004 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='004';
Conv_sken='S203970';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_005
patient='005';
Conv_sken='S204910';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_006
patient='006';
Conv_sken='S204190';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);

%% Myel_007
patient='007';
Conv_sken='S20100';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_008
patient='008';
Conv_sken='S204140';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_009
patient='009';
Conv_sken='S203570';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_010 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='010';
Conv_sken='S201320';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_011
patient='011';
Conv_sken='S204420';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_012
patient='012';
Conv_sken='S204150';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_014
patient='014';
Conv_sken='S203900';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_015
patient='015';
Conv_sken='S204740';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_016
patient='016';
Conv_sken='S204100';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_017
patient='017';
Conv_sken='S203460';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_018
patient='018';
Conv_sken='S207380';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_019
patient='019';
Conv_sken='S204320';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_020
patient='020';
Conv_sken='S204850';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);











