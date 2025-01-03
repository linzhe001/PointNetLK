#! /usr/bin/bash
#$ -l tmem=20G               
#$ -l gpu=true                
#$ -pe gpu 1                  
#$ -N ljiang_gen_perturbations      
#$ -o /SAN/medic/MRpcr/logs/genpert_output.log 
#$ -e /SAN/medic/MRpcr/logs/genpert_error.log   
#$ -wd /SAN/medic/MRpcr
# generate perturbations for each object (for each 'ModelNet40/[category]/test/*')
# Activate Conda environment
source /home/ljiang/miniconda3/etc/profile.d/conda.sh
conda activate my_env_name  
# for output
mkdir -p /SAN/medic/MRpcr/result/gt
OUTDIR=/SAN/medic/MRpcr/result/gt

# Python3 command
PY3=$(which python)

# categories for testing
CMN="-i /SAN/medic/MRpcr/datasets/ModelNet40 -c /SAN/medic/MRpcr/PointNetLK/experiments/sampledata/modelnet40_half1.txt --no-translation"
cd /SAN/medic/MRpcr/PointNetLK
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_00.csv --mag 0.0
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_01.csv --mag 0.1
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_02.csv --mag 0.2
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_03.csv --mag 0.3
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_04.csv --mag 0.4
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_05.csv --mag 0.5
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_06.csv --mag 0.6
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_07.csv --mag 0.7
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_08.csv --mag 0.8
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_09.csv --mag 0.9
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_10.csv --mag 1.0
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_11.csv --mag 1.1
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_12.csv --mag 1.2
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_13.csv --mag 1.3
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_14.csv --mag 1.4
${PY3} ./experiments/generate_perturbations.py ${CMN} -o ${OUTDIR}/pert_15.csv --mag 1.5


#EOF
