library(dplyr)
library(readxl)

df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv")

# Frequency tables
courses_counts <- table(df$number_courses)
print("Frequency Table: Number of Courses")
print(courses_counts)

study_counts <- table(df$time_study)
print("Frequency Table: Time Studied (Unique Values)")
print(study_counts)

marks_counts <- table(df$Marks)
print("Frequency Table: Marks (Unique Values)")
print(marks_counts)

# Data frame format counts
courses_df <- df %>% count(number_courses)
print("Number of Courses Frequency (Data Frame Format)")
print(courses_df)

study_df <- df %>% count(time_study)
print("Time Studied Frequency (Data Frame Format)")
print(study_df)

marks_df <- df %>% count(Marks)
print("Marks Frequency (Data Frame Format)")
print(marks_df)

# Proportion tables
courses_prop <- prop.table(courses_counts)
print("Proportion Table: Number of Courses")
print(courses_prop)

study_prop <- prop.table(study_counts)
print("Proportion Table: Time Studied")
print(study_prop)

marks_prop <- prop.table(marks_counts)
print("Proportion Table: Marks")
print(marks_prop)