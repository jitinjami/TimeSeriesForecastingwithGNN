#!/bin/bash -l
#SBATCH --job-name=electricity
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/electricity.out 
#SBATCH --error=./logfiles/electricity.err


# load modules
conda activate mlts

# your commands
python train_single_step.py --save ./models/model-electricity-3.pt --data ./data/electricity.txt --num_nodes 321 --batch_size 4 --epochs 30 --horizon 3
