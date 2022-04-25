#!/bin/bash -l
#SBATCH --job-name=solar
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/solar.out 
#SBATCH --error=./logfiles/solar.err


# load modules
conda activate mlts

# your commands
python train_single_step.py --save ./models/model-solar-3.pt --data ./data/solar_AL.txt --num_nodes 137 --batch_size 4 --epochs 30 --horizon 3
