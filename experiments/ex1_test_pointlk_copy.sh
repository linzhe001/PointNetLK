#! /usr/bin/bash

# Set memory and GPU requirements for the job
#$ -l tmem=20G
#$ -l gpu=true
#$ -pe gpu 2
#$ -N ljiang_pointlk_tests
#$ -o /SAN/medic/MRpcr/logs/pointlk_output.log
#$ -e /SAN/medic/MRpcr/logs/pointlk_error.log
#$ -wd /SAN/medic/MRpcr

# Activate Conda environment
source /home/ljiang/miniconda3/etc/profile.d/conda.sh
conda activate my_env_name

# Create output directory
OUTDIR=/SAN/medic/MRpcr/result/plk
mkdir -p ${OUTDIR}

# Python3 command
PY3="nice -n 10 python"

# Categories for testing and the trained model
MODEL=/SAN/medic/MRpcr/results/ex1_pointlk_0915_model_best.pth
CMN="-i /SAN/medic/MRpcr/datasets/MyDataset -c ./sampledata/modelnet40_half1_copy.txt --format wt --pretrained ${MODEL}"

# Perturbations directory
PERDIR=/SAN/medic/MRpcr/result/gt
cd /SAN/medic/MRpcr/PointNetLK/experiments
# Test PointNet-LK with given perturbations without using a loop
${PY3} test_pointlk_copy.py ${CMN} -o ${OUTDIR}/result_040_1.csv -p ${PERDIR}/pert_040_1.csv -l ${OUTDIR}/log_040_1.log

#EOF
