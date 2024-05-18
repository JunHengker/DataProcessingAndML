import pandas as pd

file = "datasetFalls.csv"

dataFrame = pd.read_csv(file)

# misahin data berdasarkan label
df_fall = dataFrame[dataFrame['label'] == "fall"]
df_lateralSevereFall = dataFrame[dataFrame['label'] == "lfall"]
df_reverseSevereFall = dataFrame[dataFrame['label'] == "rfall"]
df_light = dataFrame[dataFrame['label'] == "light"]
df_sit = dataFrame[dataFrame['label'] == "sit"]
df_step = dataFrame[dataFrame['label'] == "step"]
df_walk = dataFrame[dataFrame['label'] == "walk"]

print(df_fall)
print(df_lateralSevereFall)
print(df_reverseSevereFall)
print(df_light)
print(df_sit)
print(df_step)
print(df_walk)

print("Fall dataset \n")