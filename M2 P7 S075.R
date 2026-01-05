library(dplyr)

df <- read.csv("C:/Users/mvlui/Downloads/Iris.csv")

str(df)

df$Species <- as.factor(df$Species)

anova_model <- aov(SepalLengthCm ~ Species, data = df)

summary(anova_model)
