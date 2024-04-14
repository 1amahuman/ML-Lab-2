library(dplyr)  # For data handling
library(tidyr)  # For data tidying
library(caret)  # For data splitting and modeling

# Importing data from the 2 files
std <- read.csv("oulad-students.csv") 
ass <- read.csv("oulad-assessments.csv") 

# Finding the weighted mean score to use it as a feature
w_mean <- ass %>%
  group_by(id_student) %>%
  summarize(mean_weighted_score = sum(score * weight) / sum(weight))

# Join the mean weighted score with student data
std <- left_join(std, w_mean, by = "id_student")

# Convert final_result from one of 4 categories into binary (Pass or Not Pass)
std$final_result_binary <- ifelse(std$final_result == "Pass", 1, 0)

# Selecting features for the model
selected_features <- std %>%
  select(disability, date_registration, gender, code_module, mean_weighted_score, final_result_binary)

# training and testing sets
set.seed(123)
train_index <- createDataPartition(selected_features$final_result_binary, p = 0.5, list = FALSE)
train_data <- selected_features[train_index, ]
test_data <- selected_features[-train_index, ]

# Building the logistic regression model
log_model <- glm(final_result_binary ~ ., data = train_data, family = "binomial")

# Making predictions using the model we built above
preds <- predict(log_model, newdata = test_data, type = "response")
pred_class <- ifelse(preds > 0.7, 1, 0)  # Using threshold of 0.7 for binary classification

# Calculating and printing results of the model 
c_matrix <- confusionMatrix(factor(pred_class), factor(test_data$final_result_binary))
print(c_matrix$table)

accuracy <- c_matrix$overall["Accuracy"]
print(paste("Accuracy:", accuracy))

precision <- c_matrix$byClass["Pos Pred Value"]
print(paste("Precision:", precision))

recall <- c_matrix$byClass["Sensitivity"]
print(paste("Recall:", recall))

f1_score <- (2 * precision * recall) / (precision + recall)
print(paste("F1 Score:", f1_score))