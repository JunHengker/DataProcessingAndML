# Fall vs Normal Activities Feature Extraction and Classification

## Description

This repository contains the code and data for my final exam project, which focuses on machine learning and feature extraction from a dataset that distinguishes between fall and normal activities. The primary goal of this project is to develop and evaluate a machine learning model using the K-Nearest Neighbors (KNN) algorithm to accurately classify activities as either falls or normal movements based on extracted features.

The project utilizes Python for implementing the KNN algorithm and MATLAB for filtering and extracting relevant features from the dataset.

## Contents

- `datasetFalls.csv`: Contains the raw dataset that needed to be flatten and extracted for training and testing the machine learning models.
- `FILE_MATLAB/`: Consist of two MATLAB file for extracting feature (already filtered and flatten), Plotting, and more (just to fullfiled the final exam rubrik).
- `FILE_ML/`: Python scripts for making custom dataset from csv, scatter plot, machine learning model, confusion matrix, classification report (sorry i wrote it in one file, except dataset and scatter plot).
- `README.md`: This file, providing an overview of the project.

## Project Structure

1. **Data Preprocessing**: Cleaning and preparing the dataset for feature extraction.
2. **Feature Extraction**: Using MATLAB to filter the data and extract relevant features that help distinguish between falls and normal activities.
3. **Model Training**: Training the KNN algorithm using Python on the extracted features.
4. **Model Evaluation**: Evaluating the performance of the KNN model using appropriate metrics and selecting the best-performing model.
5. **Results**: Documenting the results and insights gained from the analysis.

## Requirements

- Python 3.x
- NumPy
- Pandas
- Scikit-learn
- MATLAB
- MATPLOTLIB
