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

uloz_nifti=1;
extract_masks_from_SA(pacient,uloz_nifti)