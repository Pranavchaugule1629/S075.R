library(dplyr)

df <- read.csv("C:/Users/mvlui/Downloads/winequality-white.csv", sep = ";")

head(df)
str(df)
summary(df)

df$alcohol <- as.numeric(as.character(df$alcohol))
df$quality <- as.numeric(as.character(df$quality))

df <- df %>% filter(!is.na(alcohol), !is.na(quality))

summary(df$quality)

quality_freq <- table(df$quality)
print(quality_freq)

quality_count <- df %>% count(quality)
print(quality_count)

quality_alcohol_crosstab <- table(df$quality, df$alcohol >= median(df$alcohol))
print(quality_alcohol_crosstab)

t.test(df$quality, mu = mean(df$quality))

df$Alcohol_Group <- ifelse(df$alcohol >= median(df$alcohol), "High", "Low")
df$Alcohol_Group <- factor(df$Alcohol_Group)

t.test(quality ~ Alcohol_Group, data = df)

set.seed(123)
df$quality_before <- df$quality + rnorm(nrow(df), mean = 0, sd = 0.5)

t.test(df$quality, df$quality_before, paired = TRUE)
