import pandas as pd
import matplotlib.pyplot as plt

# Load the data
file = 'datasetFalls.csv'
dataFrame = pd.read_csv(file)

# Filter rows based on the label column
df_fall = dataFrame[dataFrame['label'] == "fall"]
df_lateralSevereFall = dataFrame[dataFrame['label'] == "lfall"]
df_reverseSevereFall = dataFrame[dataFrame['label'] == "rfall"]
df_light = dataFrame[dataFrame['label'] == "light"]
df_sit = dataFrame[dataFrame['label'] == "sit"]
df_step = dataFrame[dataFrame['label'] == "step"]
df_walk = dataFrame[dataFrame['label'] == "walk"]

# paksa print semua njer
pd.set_option('display.max_columns', None)


# Function to plot accelerometer and gyroscope data
# def plot_data(df, title):
#     plt.figure(figsize=(12, 8))
    
#     # Subplot for accelerometer data
#     plt.subplot(2, 1, 1)
#     plt.plot(df['xAcc'], label='xAcc')
#     plt.plot(df['yAcc'], label='yAcc')
#     plt.plot(df['zAcc'], label='zAcc')
#     plt.title(f'{title} - Accelerometer Data')
#     plt.xlabel('Sample')
#     plt.ylabel('Acceleration (m/s^2)')
#     plt.legend()

#     # Subplot for gyroscope data
#     plt.subplot(2, 1, 2)
#     plt.plot(df['xGyro'], label='xGyro')
#     plt.plot(df['yGyro'], label='yGyro')
#     plt.plot(df['zGyro'], label='zGyro')
#     plt.title(f'{title} - Gyroscope Data')
#     plt.xlabel('Sample')
#     plt.ylabel('Gyroscope (deg/s)')
#     plt.legend()
    
#     plt.tight_layout()
#     plt.show()

# # Plot data for each category
# plot_data(df_fall, 'Fall')
# plot_data(df_lateralSevereFall, 'Lateral Severe Fall')
# plot_data(df_reverseSevereFall, 'Reverse Severe Fall')
# plot_data(df_light, 'Light')
# plot_data(df_sit, 'Sit')
# plot_data(df_step, 'Step')
# plot_data(df_walk, 'Walk')

def fallVSsit():
    plt.figure(figsize=(12, 8))
    
    # Plotting for fall data set

    # Subplot for xAcc data
    plt.subplot(3, 2, 1)
    plt.plot(df_fall['xAcc'], label='xAcc')
    plt.title(f'fall - xAcc Accelerometer Data')
    plt.xlabel('Sample')
    plt.ylabel('Acceleration (m/s^2)')
    plt.legend()

    # Subplot for yAcc data
    plt.subplot(3, 2, 3)
    plt.plot(df_fall['yAcc'], label='yAcc')
    plt.title(f'fall - yAcc Accelerometer Data')
    plt.xlabel('Sample')
    plt.ylabel('Acceleration (m/s^2)')
    plt.legend()

    # Subplot for zAcc data
    plt.subplot(3, 2, 5)
    plt.plot(df_fall['zAcc'], label='zAcc')
    plt.title(f'fall - zAcc Accelerometer Data')
    plt.xlabel('Sample')
    plt.ylabel('Acceleration (m/s^2)')
    plt.legend()

    # Subplot for xGyro data
    plt.subplot(3, 2, 2)
    plt.plot(df_fall['xGyro'], label='xGyro')
    plt.title(f'fall - xGyro Gyroscope Data')
    plt.xlabel('Sample')
    plt.ylabel('Gyroscope (deg/s)')
    plt.legend()

    plt.subplot(3, 2, 4)
    plt.plot(df_fall['yGyro'], label='yGyro')
    plt.title(f'fall - yGyro Gyroscope Data')
    plt.xlabel('Sample')
    plt.ylabel('Gyroscope (deg/s)')
    plt.legend()

    plt.subplot(3, 2, 6)
    plt.plot(df_fall['zGyro'], label='zGyro')
    plt.title(f'fall - zGyro Gyroscope Data')
    plt.xlabel('Sample')
    plt.ylabel('Gyroscope (deg/s)')
    plt.legend()


    #Plotting for sit dataset
    
    plt.tight_layout()
    plt.show()

fallVSsit()