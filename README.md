# freesurfer_cp_tool
Control point insertion tool for Freesurfer. It is comprised of shell and python scripts.

## INSTALLATION

Checkout the source code from GitHub:

```
git checkout https://github.com/DevelopmentalImagingMCRI/freesurfer_cp_tool.git
```

### DEPENDENCIES

The python dependencies are: skimage, numpy, scipy, nibabel. The following command will install these in Ubuntu:

```
apt install python-skimage python-numpy python-scipy python-nibabel
```

## RUNNING

After creating the Freesurfer directories for a subject *foo*, use the following sequence:

1. `recon-all -autorecon1 -autorecon2 -s foo`
1. `cptool_1_ribbon_defect foo`
1. `cptool_2_cps foo`
1. `cptool_3_aftercps foo`
1. `cptool_4_wm foo`
1. `recon-all -autorecon2-wm -autorecon3 -s foo`

## CHECKING OUTPUTS

There is a script `cps_edit6.sh` that will load Freeview with the control points, wm.mgz and white surfaces overlaid onto the T1. To run it type:

```
cps_edit6.sh foo
```
