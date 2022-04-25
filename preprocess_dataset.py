import urllib.request
import pandas as pd

urllib.request.urlretrieve("https://archive.ics.uci.edu/ml/machine-learning-databases/00374/energydata_complete.csv", "./data/energydata_complete.csv")

df = pd.read_csv("./data/energydata_complete.csv",index_col=0, header=1)
df.to_csv('./data/appliance.txt', sep=',', index=False)