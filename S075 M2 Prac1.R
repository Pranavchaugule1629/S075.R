library(psych)

df <- read.csv("C:/Users/mvlui/Downloads/salary_data.csv")

print("Structure of the dataset:")
str(df)

print("Column names of the dataset:")
colnames(df)

if ("Score" %in% colnames(df)) {
  print("Converting Score column to numeric")
  df$Score <- as.numeric(as.character(df$Score))
} else {
  print("Score column not found in dataset")
}

if ("Practice_Hours" %in% colnames(df)) {
  print("Converting Practice_Hours column to numeric")
  df$Practice_Hours <- as.numeric(as.character(df$Practice_Hours))
} else {
  print("Practice_Hours column not found in dataset")
}

if ("Experience_Years" %in% colnames(df)) {
  print("Converting Experience_Years column to numeric")
  df$Experience_Years <- as.numeric(as.character(df$Experience_Years))
} else {
  print("Experience_Years column not found in dataset")
}

if ("Salary" %in% colnames(df)) {
  print("Converting Salary column to numeric")
  df$Salary <- as.numeric(as.character(df$Salary))
} else {
  print("Salary column not found in dataset")
}

if ("Match_Before" %in% colnames(df)) {
  print("Converting Match_Before column to numeric")
  df$Match_Before <- as.numeric(as.character(df$Match_Before))
} else {
  print("Match_Before column not found in dataset")
}

if ("Match_After" %in% colnames(df)) {
  print("Converting Match_After column to numeric")
  df$Match_After <- as.numeric(as.character(df$Match_After))
} else {
  print("Match_After column not found in dataset")
}

print("Dataset after converting columns:")
str(df)

print("Descriptive statistics using describe() function:")
describe(df)
