import csv
import numpy as np
import pandas as pd
from sklearn.utils import Bunch
from sklearn.preprocessing import LabelEncoder

def load_dataset():
    with open(r'filter2depan2akhir.csv') as file:
        reader = csv.reader(file)
        
        # baca nama fitur di row pertama
        namaFitur = next(reader)[:-1]
        
        data = []
        target = []
        
        for row in reader:
            # ekstrak semua fitur kecuali label
            features = row[:-1]
            
            # ekstrak label
            label = row[-1]
            
            # Filter label yang dimau (adjustable aja biar enak di set sesuai kebutuhan)
            if label in ["fall", 'lfall', 'light', 'rfall', "sit", "step", "walk"]:
                # append fitur ke data
                data.append([float(num) for num in features]) 
                # append label ke target
                target.append(label)
        
        # konversi data dan target ke numpy array
        data = np.array(data)
        
        # karena target masih string, maka kita perlu konversi ke integer
        labelData = LabelEncoder()
        target = labelData.fit_transform(target)
        
    return Bunch(isiData=data, targetData=target, namaFitur=namaFitur, labelData=labelData.classes_)
