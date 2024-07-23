#!/bin/bash

/software/rosetta/latest/bin/rosetta_scripts \
file_input=$1
sym="I53"

symfile="I53.sym"
symdof1="JCP00"
symdof2="JCT00"

/software/rosetta/latest/bin/rosetta_scripts \
       	-dunbrack_prob_buried 0.8 -dunbrack_prob_nonburied 0.8 -dunbrack_prob_buried_semi 0.8 -dunbrack_prob_nonburied_semi 0.8 \
	-out::file::pdb_comments \
	-parser:protocol cage_design.xml \
	-s      ${file_input} \
	-native ${file_input} \
	-nstruct 5 \
	-parser:script_vars \
		sym="${symfile}" \
		symdof1="${symdof1}" symdof2="${symdof2}" symdof3="${symdof3}" \
	-overwrite 1 \
	-unmute all \
        -output_only_asymmetric_unit 1 \
        -failed_job_exception False \
        -mute core.select.residue_selector.SecondaryStructureSelector 

