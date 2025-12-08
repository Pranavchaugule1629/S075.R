library(dplyr)
library(tidyr)
retail_df <- data.frame(
  ID = 1:6,
  Category = c("Electronics", "Home", "Electronics", "Clothing", "Home", "Clothing"),
  Price = c(500.50, 45.00, 900.00, NA, 300.00, 25.00),
  In_Stock = c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE),
  Rating = c(4.5, 3.8, 4.9, 4.0, 3.5, 4.2)
)

print("--- Data Loaded ---")

print("--- OUTPUT OF str() ---")
str(retail_df)

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(retail_df)

retail_df$Category <- as.factor(retail_df$Category)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(retail_df)

avg_rating <- mean(retail_df$Rating)
max_price <- max(retail_df$Price, na.rm = TRUE)

print(paste("Average Rating:", avg_rating))
print(paste("Highest Price:", max_price))
