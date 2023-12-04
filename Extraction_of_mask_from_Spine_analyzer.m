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
%% Myel_021 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='021';
Conv_sken='S204850';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_022
patient='022';
Conv_sken='S205540';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_023
patient='023';
Conv_sken='S204560';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_024 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='024';
Conv_sken='S204960';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_025
patient='025';
Conv_sken='S203110';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_026
patient='026';
Conv_sken='S204380';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_027
patient='027';
Conv_sken='S204200';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_028
patient='028';
Conv_sken='S204510';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_029 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='029';
Conv_sken='S207680';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_030
patient='030';
Conv_sken='S208900';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_031 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='031';
Conv_sken='S203500';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_033
patient='033';
Conv_sken='S204260';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_034
patient='034';
Conv_sken='S204740';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_036
patient='036';
Conv_sken='S20420';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_038
patient='038';
Conv_sken='S203190';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_039
patient='039';
Conv_sken='S20380';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_040
patient='040';
Conv_sken='S20320';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%%



%% Global parameters
path_to_database='E:\Znaceni_dat\Data_pom';
path_to_SA_results='E:\Znaceni_dat\Vystup_Spine_Analyzer_v_4_3';
version_of_SA='v_4_3';
%% Myel_041
patient='041';
Conv_sken='S203510';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_042 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='042';
Conv_sken='S203730';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_043
patient='043';
Conv_sken='S203770';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_044
patient='044';
Conv_sken='S203750';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_045
patient='045';
Conv_sken='S203690';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_046
patient='046';
Conv_sken='S203270';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_047
patient='047';
Conv_sken='S203840';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_048
patient='048';
Conv_sken='S203960';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_050 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='050';
Conv_sken='S203580';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_051
patient='051';
Conv_sken='S203590';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_052
patient='052';
Conv_sken='S203400';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_053
patient='053';
Conv_sken='S203140';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_054
patient='054';
Conv_sken='S204370';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_055
patient='055';
Conv_sken='S203620';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_056
patient='056';
Conv_sken='S20300';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_057
patient='057';
Conv_sken='S203830';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_058
patient='058';
Conv_sken='S203900';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_059
patient='059';
Conv_sken='S203510';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_060 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='060';
Conv_sken='S20310';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_061
patient='061';
Conv_sken='S203890';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_062
patient='062';
Conv_sken='S203470';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_063
patient='063';
Conv_sken='S203190';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_064
patient='064';
Conv_sken='S203640';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_065
patient='065';
Conv_sken='S203450';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_066
patient='066';
Conv_sken='S203300';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_067
patient='067';
Conv_sken='S203870';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_068
patient='068';
Conv_sken='S203730';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_069
patient='069';
Conv_sken='S203710';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_070
patient='070';
Conv_sken='S204100';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_071
patient='071';
Conv_sken='S203700';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_072 problém převodu dicom2nifti - uložení mat file a přeuložení v pythonu. oprava masky nnUNet
patient='072';
Conv_sken='S203910';
save_nifti=0;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_077
patient='077';
Conv_sken='S203260';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_078
patient='078';
Conv_sken='S203720';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_079
patient='079';
Conv_sken='S203280';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_080
patient='080';
Conv_sken='S20370';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
%% Myel_081
patient='081';
Conv_sken='S204520';
save_nifti=1;
extract_masks_from_SA(path_to_database,path_to_SA_results,patient,Conv_sken,save_nifti,version_of_SA);
















