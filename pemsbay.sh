#!/bin/bash -l
#SBATCH --job-name=pemsbay
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusivee
#SBATCH --output=./logfiles/pemsbay.out 
#SBATCH --error=./logfiles/pemsbay.err


# load modules
conda activate mlts

# your commands
python train_multi_step.py --save ./models/pemsbay.pt --adj_data ./data/sensor_graph/adj_mx_bay.pkl --data ./data/PEMS-BAY/ --num_nodes 325