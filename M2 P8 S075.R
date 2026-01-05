library(dplyr)

df <- read.csv("C:/Users/mvlui/Downloads/Iris.csv")

str(df)

df$Species <- as.factor(df$Species)

df$SepalLength_Group <- cut(
  df$SepalLengthCm,
  breaks = c(0, 5, 6, 7, 10),
  labels = c("Short", "Medium", "Long", "Very_Long")
)

anova_model <- aov(PetalLengthCm ~ Species * SepalLength_Group, data = df)

summary(anova_model)
