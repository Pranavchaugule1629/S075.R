library(dplyr)
library(psych)

# Load your dataset
df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv")

# Summary statistics for Marks
print("Summary of Marks:")
summary(df$Marks)

print("Descriptive statistics of Marks:")
describe(df$Marks)

# Frequency table for number of courses
courses_counts <- table(df$number_courses)
print("Frequency Table: Number of Courses")
print(courses_counts)

# Data frame format
courses_df <- df %>% count(number_courses)
print("Number of Courses Frequency (Data Frame Format)")
print(courses_df)

# Create study time groups (binned)
df$Study_Group <- cut(
  df$time_study,
  breaks = 3,
  labels = c("Low", "Medium", "High")
)

print("Cross Tabulation: Number of Courses vs Study Group")
cross_tab <- table(df$number_courses, df$Study_Group)
print(cross_tab)

# One-sample t-test: Are Marks significantly different from 25?
print("One-sample t-test: Marks vs mu = 25")
t_test_one <- t.test(df$Marks, mu = 25)
print(t_test_one)

# Create High/Low Marks group based on median
df$Marks_Group <- ifelse(df$Marks >= median(df$Marks), "High", "Low")

print("Independent t-test: Marks by Marks_Group (High vs Low)")
t_test_two <- t.test(Marks ~ Marks_Group, data = df)
print(t_test_two)

# Create artificial Old_Marks for paired t-test
set.seed(123)  # for reproducibility
df$Old_Marks <- df$Marks + runif(nrow(df), 5, 15)

print("Paired t-test: Marks vs Old_Marks")
t_test_paired <- t.test(df$Marks, df$Old_Marks, paired = TRUE)
print(t_test_paired)