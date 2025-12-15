library(psych)

# Load your dataset
df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv")

print("Structure of the dataset:")
str(df)

print("Column names of the dataset:")
colnames(df)

# Convert columns to numeric if needed
if ("number_courses" %in% colnames(df)) {
  print("Converting number_courses to numeric")
  df$number_courses <- as.numeric(as.character(df$number_courses))
} else {
  print("number_courses column not found in dataset")
}

if ("time_study" %in% colnames(df)) {
  print("Converting time_study to numeric")
  df$time_study <- as.numeric(as.character(df$time_study))
} else {
  print("time_study column not found in dataset")
}

if ("Marks" %in% colnames(df)) {
  print("Converting Marks to numeric")
  df$Marks <- as.numeric(as.character(df$Marks))
} else {
  print("Marks column not found in dataset")
}

print("Dataset after converting columns:")
str(df)

print("Descriptive statistics using describe() function:")
describe(df)