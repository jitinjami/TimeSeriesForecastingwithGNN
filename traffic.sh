#!/bin/bash -l
#SBATCH --job-name=traffic
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/traffic.out 
#SBATCH --error=./logfiles/traffic.err


# load modules
conda activate mlts

# your commands
python train_single_step.py --save ./models/model-traffic3.pt --data ./data/traffic.txt --num_nodes 862 --batch_size 16 --epochs 30 --horizon 3
