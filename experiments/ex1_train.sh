#! /usr/bin/bash
#$ -l tmem=20G
#$ -l gpu=true
#$ -pe gpu 3
#$ -N ljiang_train_models
#$ -o /SAN/medic/MRpcr/logs/train_models_output.log
#$ -e /SAN/medic/MRpcr/logs/train_models_error.log
#$ -wd /SAN/medic/MRpcr

# Activate Conda environment
source /home/ljiang/miniconda3/etc/profile.d/conda.sh
conda activate my_env_name  

# Create output directory
mkdir -p /SAN/medic/MRpcr/results

# Python3 command
PY3=$(which python)
cd /SAN/medic/MRpcr/PointNetLK/experiments
# Train a classifier
# ModelNet categories are given in './sampledata/modelnet40_half1.txt' (as example)
${PY3} train_classifier.py \
 -o /SAN/medic/MRpcr/results/ex1_classifier_0915 \
 -i /SAN/medic/MRpcr/datasets/ModelNet40 \
 -c /SAN/medic/MRpcr/PointNetLK/experiments/sampledata/modelnet40_half1.txt \
 -l /SAN/medic/MRpcr/results/ex1_classifier_0915.log \
 --device cuda:0

# The output of this step:
# '/SAN/medic/MRpcr/results/ex1_classifier_0915_feat_best.pth'
# This file is the model that computes PointNet feature.

# Train PointNet-LK
# Fine-tune the PointNet feature for classification using the above file.
${PY3} train_pointlk.py \
 -o /SAN/medic/MRpcr/results/ex1_pointlk_0915 \
 -i /SAN/medic/MRpcr/datasets/ModelNet40 \
 -c /SAN/medic/MRpcr/PointNetLK/experiments/sampledata/modelnet40_half1.txt \
 -l /SAN/medic/MRpcr/results/ex1_pointlk_0915.log \
 --transfer-from /SAN/medic/MRpcr/results/ex1_classifier_0915_feat_best.pth \
 --epochs 400 \
 --device cuda:1

# The trained model:
# '/SAN/medic/MRpcr/results/ex1_pointlk_0915_model_best.pth'

#EOF
