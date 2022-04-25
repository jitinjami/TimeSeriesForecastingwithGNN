# MTGNN
Original implmenetation by [nnZhan](https://github.com/nnzhan): [https://github.com/nnzhan/MTGNN](https://github.com/nnzhan/MTGNN)

This is a PyTorch implementation of the paper: [Connecting the Dots: Multivariate Time Series Forecasting with Graph Neural Networks](https://arxiv.org/abs/2005.11650). 

## Requirements
The model is implemented using Python3 with dependencies specified in requirements.txt or generate conda environment with requirements.yml
```
conda env create -f requirements.yml
```
## Data Preparation
### Multivariate time series datasets

Download Solar-Energy, Traffic, Electricity, Exchange-rate datasets from [https://github.com/laiguokun/multivariate-time-series-data](https://github.com/laiguokun/multivariate-time-series-data). Uncompress them and move them to the data folder.

### Traffic datasets
Download the METR-LA and PEMS-BAY dataset from [Google Drive](https://drive.google.com/open?id=10FOTa6HXPqX8Pf5WRoRwcFnW9BrNZEIX) or [Baidu Yun](https://pan.baidu.com/s/14Yy9isAIZYdU__OYEQGa_g) provided by [Li et al.](https://github.com/liyaguang/DCRNN.git) . Move them into the data folder. 

```

# Create data directories
mkdir -p data/{METR-LA,PEMS-BAY}

# METR-LA
python generate_training_data.py --output_dir=data/METR-LA --traffic_df_filename=data/metr-la.h5

# PEMS-BAY
python generate_training_data.py --output_dir=data/PEMS-BAY --traffic_df_filename=data/pems-bay.h5

```

### Appliance Dataset
The following script downloads and pre-processes the dataset available on [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Appliances+energy+prediction) provided by [Luis et al.](https://linkinghub.elsevier.com/retrieve/pii/S0378778816308970)
```
# Appliance
python preprocess_dataset.py
```


## Model Training

### Single-step

* Solar-Energy

```
python train_single_step.py --save ./models/model-solar-3.pt --data ./data/solar_AL.txt --num_nodes 137 --batch_size 4 --epochs 30 --horizon 3
```
* Traffic 

```
python train_single_step.py --save ./models/model-traffic3.pt --data ./data/traffic.txt --num_nodes 862 --batch_size 16 --epochs 30 --horizon 3
```

* Electricity

```
python train_single_step.py --save ./models/model-exchange-3.pt --data ./data/exchange_rate.txt --num_nodes 8 --subgraph_size 8  --batch_size 4 --epochs 30 --horizon 3
```

* Exchange-Rate

```
python train_single_step.py --save ./model/model-exchange-3.pt --data ./data/exchange_rate.txt --num_nodes 8 --subgraph_size 8  --batch_size 4 --epochs 30 --horizon 3
```

* Appliance
```
python train_single_step.py --save ./models/model-appliance.pt --data ./data/appliance.txt --num_nodes 28 --batch_size 4 --epochs 30 --horizon 3
```
### Multi-step
* METR-LA

```
python train_multi_step.py --save ./models/metrla.pt --adj_data ./data/sensor_graph/adj_mx.pkl --data ./data/METR-LA --num_nodes 207
```
* PEMS-BAY

```
python train_multi_step.py --save ./models/pemsbay.pt --adj_data ./data/sensor_graph/adj_mx_bay.pkl --data ./data/PEMS-BAY/ --num_nodes 325
```

## Bash Runs
If in case you want to submit a bash run on the [USI Cluster](https://www.ics.usi.ch/index.php/ics-research/resources). After installing the requirements on a conda environment, the following commands can be used on the command line.

### Single-step

* Solar-Energy

```
sbatch solar.sh
```
* Traffic 

```
sbatch traffic.sh
```

* Electricity

```
sbatch electricity.sh
```

* Exchange-Rate

```
sbatch exchange.sh
```

* Appliance
```
sbatch appliance.sh
```

### Multi-step
* METR-LA

```
sbatch metrla.sh
```
* PEMS-BAY

```
sbatch pemsbay.sh
```
