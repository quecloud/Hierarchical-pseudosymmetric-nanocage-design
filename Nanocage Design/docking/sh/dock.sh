sym=$1
comp1=$2
comp2=$3

if [[ ! -e output/ ]]; then mkdir output/; fi
if [[ ! -e output/${sym}/ ]]; then mkdir output/${sym}/; fi
if [[ ! -e output/${sym}/${comp1}/ ]]; then mkdir output/${sym}/${comp1}/; fi
if [[ ! -e output/${sym}/${comp1}/${comp2}/ ]]; then mkdir output/${sym}/${comp1}/${comp2}/; fi
outpath="output/${sym}/${comp1}/${comp2}"

/tcdock.static.linuxgccrelease \
	@input/tcdock_digs.flags \
	-architecture ${sym} \
	-component1 input/scaffolds/${comp1}.pdb \
	-component2 input/scaffolds/${comp2}.pdb \
	-o ${outpath} > ${outpath}/${sym}_${comp1}_${comp2}.log
