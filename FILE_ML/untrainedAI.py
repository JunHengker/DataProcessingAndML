import pandas as pd
import loadDataset as dataset
import matplotlib.pyplot as plt
import scatterPlot as scatter
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report

# target 0 itu fall data, 1 itu sit data

scatterPlot = scatter.scatter_plot

data = dataset.load_dataset()

isiData = data.isiData
target = data.targetData
namaFitur = data.namaFitur
label = data.labelData

df = pd.DataFrame(isiData, columns = namaFitur)
df.columns = ['Zero_Crossing_Rate', 'Range', 'Min', 'Max', 'Variance', 'Standard Deviation']

df['target'] = target
# print(df.head())

# print(df[df.target==1].head())

df['aktivitas'] = df.target.apply(lambda x: label[x])


# print(df)

# misahin data berdasarkan label
# df0 = df[:10]
# # df1 = df[10:20]
# # df2 = df[20:30]
# # df3 = df[30:40]
# df4 = df[40:50]
# # df5 = df[50:60]
# # df6 = df[60:70]

# # print(df6)

# # selectedDf = [df0, df1, df2, df3, df4, df5, df6]
# # selectedColors = ['red', 'blue', 'green', 'yellow', 'black', 'orange', 'purple' ]
# # selectedLabel = ['Fall', 'Lateral Severe Fall', 'Light', 'Revese Fall', 'Sit', 'Step', 'Walk' ]

# # fitur yang dipilih bsa disesuaikan
# selected_features = ['Zero_Crossing_Rate', 'Min', 'Max', 'Range']
# selectedColors = ['red', 'black'] # pengklasifikasian 2 label
# selectedDf = [df0, df4] # pengklasifikasian 2 label
# selectedLabel = ['Fall', 'Sit' ] # pengklasifikasian 2 label

# # bikin 3d plot buat fall dan sit
# scatterPlot(selectedDf, selected_features, selectedColors, selectedLabel, 'Classification')




# masuk ke training machine learning

# proporsi train dan test 80:20, jadi test_size = 0.2
x = df.drop(['target', 'aktivitas'], axis='columns')
y = df.target

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=1)


# untuk mencari nilai k terbaik

# for i in range(1, 11):
#     knn = KNeighborsClassifier(n_neighbors=i)
#     knn.fit(X_train, y_train)
#     train_score = knn.score(X_train, y_train)
#     test_score = knn.score(X_test, y_test)
    
#     print(f"KNN with {i} neighbors:")
#     print(f"  Train score: {train_score}")
#     print(f"  Test score: {test_score}")

knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(X_train, y_train)

# outcome = knn.predict([[12,12.6,-9.72,2.88,2.17935936912226,1.4762653450929]])
# print(outcome) # 0 itu fall, 1 itu sit

# if outcome == 0:
#     print("Fall")
# elif outcome == 1:
#     print("Sit")


# confusion matrix 
y_pred = knn.predict(X_test)
cm = confusion_matrix(y_test, y_pred)
plt.figure(figsize=(7,5))
sns.heatmap(cm, annot=True)
plt.title('Confusion Matrix')
plt.xlabel('Predicted')
plt.ylabel('Truth')
plt.show()

#clasification report
print(classification_report(y_test, y_pred))


