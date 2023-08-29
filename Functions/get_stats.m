function [stats]=get_stats(current_path,patient,Conv_sken_name,Voxel_value_measurements)
%% Načtení originálních ROI dat, pozic BB a label obratlů
path_to_orig_data=[current_path patient '\Conv_data_and_labels' Conv_sken_name '\Results' Conv_sken_name '.mat' ];
load(path_to_orig_data); % Load of conv CT data and parameters
%%
korekce_HU_orig_data=1024;
orig3Droi=int16(Data.orig3Droi)-korekce_HU_orig_data;  %Original data from conv CT
positions_orig=Data.positions_orig; %Positions of ROI in orig full scan
label_seg_vertebra=Data.orig3DroiSeg; %labels of segmented vertebrae
%% Načtení validovaných lézí z algoritmu Jirky a Romana
path_to_valid_lesion=[current_path patient '\Conv_data_and_labels' Conv_sken_name '\Results' Conv_sken_name '_validated.mat' ];
mask_val_lesion=load(path_to_valid_lesion); % Load of valid labels of lesions from J+R algorithm
mask3DroiValAxi=logical(mask_val_lesion.orig3DroiVal.axi); %extraction of axial scan
%% kontrola orig dat a lézí
imfuse5(orig3Droi,mask3DroiValAxi)

%% Vytvoření tabulky s výsledky a pro průměrné hodnoty v konvenčním skenu
stats=regionprops3(mask3DroiValAxi,orig3Droi,'Centroid','Volume');

%% Přidání sloupce, v jakém obratli se léze nachází
stats.Vertebra=zeros(size(stats,1),1); % Adding of new colom with vertebrae number
for i=1:size(stats,1)
    leze=stats(i,:);
    centroid=round(table2array(leze(1,2)));
    stats(i,3)=table(label_seg_vertebra(centroid(2),centroid(1),centroid(3)));
end
%% Přidání průměrných hodnot v conv CT datech
stats.(['Conv CT - ' Voxel_value_measurements ])=table2array(regionprops3(mask3DroiValAxi,orig3Droi,Voxel_value_measurements));

%% Načtení VMI dat a seřazeni dle energie
path_to_VMI_data=[current_path patient '\VMI']; % Path to VMI data
collectionVMI = dicomCollection(path_to_VMI_data);  %Creation of collection with VMI data
collectionVMI_sort=sortrows(collectionVMI,"SeriesDateTime"); %sort of rows to get VMI of 50 to 140
names=collectionVMI_sort.Row; % geting of names of rows in collection

%% Procházení a přidání průměrných hodnot na různých VMI
for i=1:length(names)
    data_pom=int16(squeeze(dicomreadVolume(collectionVMI_sort,names{i})))-korekce_HU_orig_data; % Load of one VMI scan
    data_pom_flip=data_pom(:,:,end:-1:1); % Flip of scan by z-axis
    % Getting of ROI 
    data_pom_roi=data_pom_flip(positions_orig(1):positions_orig(2),positions_orig(3):positions_orig(4),positions_orig(5):positions_orig(6));
%     imfuse5(data_pom_roi,mask3DroiValAxi) %for control of lesions in data
    series_name=table2array(collectionVMI_sort(i,"SeriesDescription")) % Getting of name of VMI energy
    pom_stats=table2array(regionprops3(mask3DroiValAxi,data_pom_roi,Voxel_value_measurements));
    stats.(series_name)=pom_stats;
end
%%
stats(stats.Volume<10,:)=[];
clear data_pom data_pom_flip data_pom_roi

%% Procházení a přidání průměrných hodnoty v Ca_suppres
% path_to_Ca_supress_data=[current_path patient '\Ca_suppres']; % Path to Ca_suppres data
% collection_Ca_suppres = dicomCollection(path_to_Ca_supress_data); 
% data_pom=squeeze(dicomreadVolume(collection_Ca_suppres,'s1'));
% data_pom_flip=data_pom(:,:,end:-1:1); % Flip of scan by z-axis
% data_pom_roi=data_pom_flip(positions_orig(1):positions_orig(2),positions_orig(3):positions_orig(4),positions_orig(5):positions_orig(6));
% series_name=table2array(collection_Ca_suppres(1,"SeriesDescription")) % Getting of name of Ca_suppres
% pom_stats=table2array(regionprops3(mask3DroiValAxi,data_pom_roi,Voxel_value_measurements));
% % imfuse5(data_pom_roi,mask3DroiValAxi)
% stats.(series_name)=pom_stats;

%% Procházení a přidání průměrných hodnoty v Zeff 
% path_to_Zeff_data=[current_path patient '\Zeff']; % Path to Zeff data
% collection_Zeff = dicomCollection(path_to_Zeff_data); 
% data_pom=squeeze(dicomreadVolume(collection_Zeff,'s1'));
% data_pom_flip=data_pom(:,:,end:-1:1); % Flip of scan by z-axis
% data_pom_roi=data_pom_flip(positions_orig(1):positions_orig(2),positions_orig(3):positions_orig(4),positions_orig(5):positions_orig(6));
% series_name=table2array(collection_Zeff(1,"SeriesDescription")) % Getting of name of Ca_suppres
% pom_stats=table2array(regionprops3(mask3DroiValAxi,data_pom_roi,Voxel_value_measurements));
% % imfuse5(data_pom_roi,mask3DroiValAxi)
% stats.(series_name)=pom_stats;



