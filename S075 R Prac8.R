install.packages("tidyr")
library(dplyr)
library(tidyr)

retail_df <- read.csv("C:/Users/mvlui/Downloads/former_names.csv", na.strings = c("", "NA"))

print(head(retail_df))
print(colSums(is.na(retail_df)))

clean_omit <- na.omit(retail_df)
print(paste("Original rows:", nrow(retail_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

avg_price <- mean(retail_df$Price, na.rm = TRUE)

clean_replace <- retail_df %>%
  replace_na(list(
    Category = "Unknown",
    Discount = 0,
    Stock = "Check Warehouse",
    Price = avg_price
  ))

print(head(clean_replace))
print(colSums(is.na(clean_replace)))
