#!/bin/bash

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
	freeview -v \
	 $SUBJECTS_DIR/$1/mri/T1.mgz \
	 $SUBJECTS_DIR/$1/mri/brainmask.mgz:grayscale=31,103 \
	 $SUBJECTS_DIR/$1/mri/wm.mgz:visible=1:colormap=gecolor:opacity=0.5 \
	 -f $LHWHITESURF:edgecolor=blue:edgethickness=3 \
	 $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=red \
	 $RHWHITESURF:edgecolor=blue:edgethickness=3 \
	 $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=red \
	 -c $SUBJECTS_DIR/$1/tmp/control.dat:radius=1
	 
#SUBJECTS_DIR/$1/mri/aseg.presurf.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/aseg.mask.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/surface.defects.skel.mgz:colormap=lut:opacity=0.35 \
#$SUBJECTS_DIR/$1/mri/aseg.wm.dilated.mgz:colormap=lut:opacity=0.35 \

fi
