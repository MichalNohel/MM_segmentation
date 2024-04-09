# -*- coding: utf-8 -*-
"""
Created on Thu Feb  1 21:25:45 2024

@author: nohel
"""

import numpy as np
#from batchgenerators.utilities.file_and_folder_operations import *
import nibabel as nib
from skimage.metrics import hausdorff_distance

def DICE(gt, predict):
    gt = (gt > 0).astype(np.float32)
    seg = (predict > 0).astype(np.float32)
    return np.sum(seg[gt == True])*2.0 / (np.sum(seg) + np.sum(gt))



def DICE_multilabel(gt, predict):

    labels=np.unique(gt)
    labels=np.delete(labels,0)
    array_DICE=[]
    for i in labels:

        pom_predict=predict.copy()
        pom_predict[pom_predict!=i]=0
        
        pom_gt=gt.copy()
        pom_gt[pom_gt!=i]=0
        
        array_DICE.append(DICE(pom_gt, pom_predict))
    
    return array_DICE, np.mean(array_DICE)
    

def Hausdorff(gt, predict):
    gt = (gt > 0).astype(np.float32)
    seg = (predict > 0).astype(np.float32)
    return hausdorff_distance(gt, seg)


def Hausdorff_multilabel(gt, predict):

    labels=np.unique(gt)
    labels=np.delete(labels,0)
    array_hausdorff=[]
    for i in labels:

        pom_predict=predict.copy()
        pom_predict[pom_predict!=i]=0
        
        pom_gt=gt.copy()
        pom_gt[pom_gt!=i]=0
        
        array_hausdorff.append(Hausdorff(pom_gt, pom_predict))
    
    return array_hausdorff, np.mean(array_hausdorff)

if __name__ == "__main__":
    
    path_to_predicted_data="E:/nnUNet_v2_MAIN_FILE/nnUNet_results/Dataset908_Lumbar_spine_seg/predict/TEST_DATASET/";
    path_GT_labels='E:/nnUNet_v2_MAIN_FILE/nnUNet_raw/Dataset908_Lumbar_spine_seg/labelsTs/LumVBCanSeg_test/'
    
    test_patient_names=subfiles(path_to_predicted_data, join=False, suffix=".nii.gz")
    binary_DICE=[]
    multilabel_DICE_mean=[]
    multilabel_DICE_array=[]
    
    binary_housdorf=[]
    multilabel_housdorf_mean=[]
    multilabel_housdorf_array=[]
    
    for p in test_patient_names:
        label_file = join(path_GT_labels, p)
        predicted_file = join(path_to_predicted_data, p)
        
        nii_predicted = nib.load(predicted_file).get_fdata()
        nii_label=nib.load(label_file).get_fdata()
        
        #DICE
       
        multilabel_DICE_array_pom,multilabel_DICE_mean_pom=DICE_multilabel(nii_label, nii_predicted)
        
        multilabel_DICE_array.append(multilabel_DICE_array_pom)
        multilabel_DICE_mean.append(multilabel_DICE_mean_pom) 
        
        binary_DICE.append(DICE(nii_label, nii_predicted))
        
        
        #Housdorf distance
        
        multilabel_housdorf_array_pom,multilabel_housdorf_mean_pom=Hausdorff_multilabel(nii_label, nii_predicted)
        
        multilabel_housdorf_array.append(multilabel_housdorf_array_pom)
        multilabel_housdorf_mean.append(multilabel_housdorf_mean_pom) 
        
        binary_housdorf.append(Hausdorff(nii_label, nii_predicted))
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    