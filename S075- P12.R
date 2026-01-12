bats_data <- read.csv("C:/Users/Hp/Downloads/bats_information.csv")

head(bats_data)
str(bats_data)

bats_data$Lifespan_Num <- as.numeric(sapply(strsplit(bats_data$Average.Lifespan, "-"), "[", 1))

numeric_data <- bats_data[sapply(bats_data, is.numeric)]

head(numeric_data)

correlation_matrix <- cor(numeric_data)

print(correlation_matrix)

rounded_correlation <- round(correlation_matrix, 2)
print(rounded_correlation)