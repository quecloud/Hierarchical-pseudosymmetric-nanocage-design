#!/bin/bash

inpdb2=C3_I5350A_sym.pdb
	
resi1=$1
resn1=$2
resi2=$3
resn2=$4

if [ ! $resi1 == "" ];then
	
	cp ./input/${inpdb1}.pdb ./input/${resi1}${resn1}_${resi1}${resn2}_${inpdb1}.pdb

	if [ ! -e output/ ]; then mkdir output/; fi

	/software/rosetta/latest/bin/rosetta_scripts \
	        -database /software/rosetta/latest/main/database/ \
		-s input/${resi1}${resn1}_${resi1}${resn2}_${inpdb1}.pdb \
		-ex1 \
		-ex2 \
		-testing \
		-use_input_sc \
		-beta \
		-parser:protocol xml/enumerative_interface.xml \
		-script_vars resi1=$resi1 resn1=$resn1 resi2=$resi2 resn2=$resn2 \
		-out::path::all output/ > output/${resi1}${resn1}_${resi1}${resn2}_${inpdb1}.log \
		-out:file:scorefile ${resi1}${resn1}_${resi1}${resn2}_${inpdb1}.sc \
		-overwrite 1 \
		-chemical:exclude_patches LowerDNA UpperDNA Cterm_amidation SpecialRotamer VirtualBB ShoveBB VirtualDNAPhosphate VirtualNTerm CTermConnect sc_orbitals pro_hydroxylated_case1 pro_hydroxylated_case2 ser_phosphorylated thr_phosphorylated tyr_phosphorylated tyr_sulfated lys_dimethylated lys_monomethylated lys_trimethylated lys_acetylated glu_carboxylated cys_acetylated tyr_diiodinated N_acetylated C_methylamidated MethylatedProteinCterm  

	rm ./input/${resi1}${resn1}_${resi1}${resn2}_${inpdb1}.pdb
	
	echo "Rosetta done"
else
	echo "Empty residue number"
fi
