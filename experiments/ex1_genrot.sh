#! /usr/bin/bash
#$ -l tmem=20G
#$ -l gpu=true
#$ -pe gpu 1
#$ -N ljiang_generate_rotations
#$ -o /SAN/medic/MRpcr/logs/genrot_output.log
#$ -e /SAN/medic/MRpcr/logs/genrot_error.log
#$ -wd /SAN/medic/MRpcr

# Activate Conda environment
source /home/ljiang/miniconda3/etc/profile.d/conda.sh
conda activate my_env_name

# Create output directory
OUTDIR=/SAN/medic/MRpcr/result/gt
mkdir -p ${OUTDIR}

# Python3 command
PY3=$(which python)

# Categories for testing
CMN="-i /SAN/medic/MRpcr/datasets/ModelNet40 -c /SAN/medic/MRpcr/PointNetLK/experiments/sampledata/modelnet40_half1.txt --format wt"

cd /SAN/medic/MRpcr/PointNetLK/experiments
# Generate rotations
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_000.csv --deg 0.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_010.csv --deg 10.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_020.csv --deg 20.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_030.csv --deg 30.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_040.csv --deg 40.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_050.csv --deg 50.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_060.csv --deg 60.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_070.csv --deg 70.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_080.csv --deg 80.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_090.csv --deg 90.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_100.csv --deg 100.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_110.csv --deg 110.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_120.csv --deg 120.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_130.csv --deg 130.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_140.csv --deg 140.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_150.csv --deg 150.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_160.csv --deg 160.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_170.csv --deg 170.0
${PY3} generate_rotations.py ${CMN} -o ${OUTDIR}/pert_180.csv --deg 180.0

#EOF
