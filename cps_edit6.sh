#!/bin/bash

T=`tmpnam`

if [ -d "$1" ]
then
	
	if [ -f "$SUBJECTS_DIR/$1/surf/rh.white.preaparc" ]
	then
		LHWHITESURF=$SUBJECTS_DIR/$1/surf/lh.white.preaparc
		RHWHITESURF=$SUBJECTS_DIR/$1/surf/rh.white.preaparc
	else
		LHWHITESURF=$SUBJECTS_DIR/$1/surf/lh.white
		RHWHITESURF=$SUBJECTS_DIR/$1/surf/rh.white
	fi
	cat << EOF > $T
	-v $SUBJECTS_DIR/$1/mri/T1.mgz
	-v $SUBJECTS_DIR/$1/mri/brainmask.mgz:grayscale=31,103
	-v $SUBJECTS_DIR/$1/mri/wm.mgz:visible=1:colormap=gecolor:opacity=0.5
	-v $SUBJECTS_DIR/$1/mri/surface.defects.mgz:colormap=lut:lut=$FREESURFER_HOME/DefectLUT.txt:opacity=0.35
	-f $LHWHITESURF:edgecolor=blue:edgethickness=3
	-f $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=red
	-f $RHWHITESURF:edgecolor=blue:edgethickness=3
	-f $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=red
EOF
	if [ -f "$SUBJECTS_DIR/$1/tmp/control.dat" ]
	then
		echo "-c $SUBJECTS_DIR/$1/tmp/control.dat:radius=1" >> $T
	fi
	freeview -cmd $T
	rm -f $T
	 
#SUBJECTS_DIR/$1/mri/aseg.presurf.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/aseg.mask.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/surface.defects.skel.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/aseg.wm.dilated.mgz:colormap=lut:opacity=0.35 \

fi
