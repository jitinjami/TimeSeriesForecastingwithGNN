#!/bin/bash -l
#SBATCH --job-name=metrla
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/metrla.out 
#SBATCH --error=./logfiles/metrla.err


# load modules
conda activate mlts

# your commands
python train_multi_step.py --save ./models/metrla.pt --adj_data ./data/sensor_graph/adj_mx.pkl --data ./data/METR-LA --num_nodes 207