function [dice_payer_spineanalyzer,dice_payer_nnunet,dice_nnunet_spineanalyzer]=calculateDICE(seg_payer,seg_nn_unet,seg_spine_analyzer)

dice_payer_spineanalyzer=dice(logical(seg_payer),logical(seg_spine_analyzer));

dice_payer_nnunet=dice(logical(seg_payer),logical(seg_nn_unet));

dice_nnunet_spineanalyzer=dice(logical(seg_nn_unet),logical(seg_spine_analyzer));
