import pandas as pd

file = "datasetFalls.csv"

dataFrame = pd.read_csv(file)

sample = dataFrame.sample(n=50)

# hasil = dataFrame.describe()
# print(sample)

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

# analisisFall = df_fall.describe()
# analisisLateralSevereFall = df_lateralSevereFall.describe()
# analisisReverseSevereFall = df_reverseSevereFall.describe()
# analisisLight = df_light.describe()
# analisisSit = df_sit.describe()
# analisisStep = df_step.describe()
# analisisWalk = df_walk.describe()

# analisisFall = df_fall.kurt()
# analisisLateralSevereFall = df_lateralSevereFall.kurt()
# analisisReverseSevereFall = df_reverseSevereFall.kurt()
# analisisLight = df_light.kurt()
# analisisSit = df_sit.kurt()
# analisisStep = df_step.kurtosis()
# analisisWalk = df_walk.kurtosis()


# # print semua label dong bejier
# pd.set_option('display.max_columns', None)

# print("Fall dataset \n")
# print(analisisFall)

# print("\n\nLateral Severe Fall dataset \n")
# print(analisisLateralSevereFall)

# print("\n\nReverse Severe Fall dataset \n")
# print(analisisReverseSevereFall)

# print("\n\nLight dataset \n")
# print(analisisLight)

# print("\n\nSit dataset \n")
# print(analisisSit)

# print("\n\nStep dataset \n")
# print(analisisStep)

# print("\n\nWalk dataset \n")
# print(analisisWalk)



