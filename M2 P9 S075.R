library(dplyr)

df <- read.csv("C:/Users/mvlui/Downloads/Iris.csv")

str(df)

df$Species <- as.factor(df$Species)

df$SepalLength_Group <- cut(
  df$SepalLengthCm,
  breaks = c(0, 5, 6, 7, 10),
  labels = c("Short", "Medium", "Long", "Very_Long")
)

table_species_sepal <- table(df$Species, df$SepalLength_Group)

table_species_sepal

chi_result <- chisq.test(table_species_sepal)

chi_result
