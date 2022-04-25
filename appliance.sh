#!/bin/bash -l
#SBATCH --job-name=appliance
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/appliance.out 
#SBATCH --error=./logfiles/appliance.err


# load modules
conda activate mlts

# your commands
python train_single_step.py --save ./models/model-appliance.pt --data ./data/appliance.txt --num_nodes 28 --batch_size 4 --epochs 30 --horizon 3
