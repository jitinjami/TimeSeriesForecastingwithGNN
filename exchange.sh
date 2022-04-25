#!/bin/bash -l
#SBATCH --job-name=exchange
#SBATCH --time=24:00:00 
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --output=./logfiles/exchange.out 
#SBATCH --error=./logfiles/exchange.err


# load modules
conda activate mlts

# your commands
python train_single_step.py --save ./models/model-exchange-3.pt --data ./data/exchange_rate.txt --num_nodes 8 --subgraph_size 8  --batch_size 4 --epochs 30 --horizon 3
