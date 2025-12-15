library(dplyr)

# Load dataset
df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv")

# Basic exploration
head(df)
str(df)
summary(df)

# Convert columns to numeric (safeguard)
df$number_courses <- as.numeric(df$number_courses)
df$time_study <- as.numeric(df$time_study)
df$Marks <- as.numeric(df$Marks)

# Check missing values
sum(is.na(df$number_courses))
sum(is.na(df$time_study))
sum(is.na(df$Marks))

# Remove rows with missing values
df <- df %>% filter(!is.na(number_courses),
                    !is.na(time_study),
                    !is.na(Marks))

# Summaries
summary(df$number_courses)
summary(df$time_study)
summary(df$Marks)

# Frequency tables
courses_freq <- table(df$number_courses)
print("Frequency Table: Number of Courses")
print(courses_freq)

study_freq <- table(df$time_study)
print("Frequency Table: Time Studied (unique values)")
print(study_freq)

marks_freq <- table(df$Marks)
print("Frequency Table: Marks (unique values)")
print(marks_freq)

# Cross-tab: high vs low study time and high vs low marks
study_group <- df$time_study > median(df$time_study)
marks_group <- df$Marks > median(df$Marks)

study_marks_crosstab <- table(study_group, marks_group)
print("Cross-tab: Study Time Group vs Marks Group")
print(study_marks_crosstab)

# One-sample t-tests
print("One-sample t-test: Marks vs mean(Marks)")
t.test(df$Marks, mu = mean(df$Marks))

print("One-sample t-test: Study Time vs mean(time_study)")
t.test(df$time_study, mu = mean(df$time_study))

# Independent t-test: study time vs marks
print("Independent t-test: time_study vs Marks")
t.test(df$time_study, df$Marks)

# Paired t-test (artificial example)
set.seed(123)
df$Old_Marks <- df$Marks + runif(nrow(df), 5, 15)

print("Paired t-test: Marks vs Old_Marks")
t.test(df$Marks, df$Old_Marks, paired = TRUE)