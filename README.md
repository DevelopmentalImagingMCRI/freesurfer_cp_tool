# freesurfer_cp_tool
Control point insertion tool for Freesurfer

## INSTALLATION

### DEPENDENCIES

'''
apt install python-skimage python-numpy python-scipy python-nibabel
'''

##

1. recon-all -autorecon1 -autorecon2
1. cptool_1_ribbon_defect
1. cptool_2_cps
1. recon-all -normalization2 -segmentation
1. cptool_3_wm
1. recon-all -autorecon2-wm -autorecon3
