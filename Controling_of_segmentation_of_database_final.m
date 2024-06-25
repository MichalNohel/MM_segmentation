clear all
close all
clc
addpath Functions
path_to_database='E:\ISP_Myelomy_export\';
%% Myel_001
patient='001'
ID_patient='S80060';
path_to_orig_data=[path_to_database ID_patient];
DATA=load_dicom_series(path_to_orig_data,patient);
imshow5(DATA)
%%




%% Myel_002
patient='002'
ID_patient='S84960';
path_to_orig_data=[path_to_database ID_patient];
DATA=load_dicom_series(path_to_orig_data,patient);
imshow5(DATA)

