# Student Performance Prediction using Logistic Regression

This repository contains code for building a logistic regression model to predict student performance based on various features. The model is trained on data from the Open University Learning Analytics dataset.

## Overview

The goal of this project is to develop a predictive model that can classify students into two categories: Pass or Not Pass, based on their demographic information, academic module, and weighted mean score of assessments. Logistic regression is chosen as the modeling technique due to its suitability for binary classification problems.

## Files

- `oulad-students.csv`: Dataset containing information about students.
- `oulad-assessments.csv`: Dataset containing assessment information.

## Libraries Used

- `dplyr`: For data manipulation.
- `tidyr`: For data tidying.
- `caret`: For data splitting and modeling.

## Workflow

1. **Data Import**: Two CSV files containing student and assessment data are imported.
2. **Feature Engineering**: The weighted mean score for each student is calculated and added as a feature.
3. **Data Preparation**: Features are selected and converted into appropriate formats.
4. **Model Training**: The logistic regression model is trained using the selected features.
5. **Model Evaluation**: Predictions are made on the test set, and performance metrics such as accuracy, precision, recall, and F1 score are calculated.
6. **Interpretation**: Besides accuracy, it's important to interpret other aspects of the model. For instance, precision represents the proportion of true positive predictions out of all positive predictions, indicating the model's ability to avoid false positives. Recall, on the other hand, represents the proportion of true positive predictions out of all actual positive instances in the data, showing the model's ability to capture all positive instances. F1 score is a harmonic mean of precision and recall, providing a balanced metric that considers both false positives and false negatives.

## Model Performance

The model achieved the following performance metrics on the test set:

- **Accuracy**: 0.54
- **Precision**: 0.54
- **Recall**: 0.99
- **F1 Score**: 0.70

The confusion matrix illustrating the model's predictions versus actual values is as follows:

| Prediction |     0     |   1   |
|------------|-----------|-------|
|      0     |   6412    |  5483 |
|      1     |     49    |  125  |

These metrics provide insights into how well the model is performing in classifying students as Pass or Not Pass based on the selected features.

## How to Use

1. Clone this repository.
2. Ensure that R and the required libraries are installed.
3. Run the provided R script `student_performance_prediction.R`.
4. View the output to analyze model performance and predictions.

## References

- Open University Learning Analytics Dataset: [Link](https://analyse.kmi.open.ac.uk/open_dataset)

