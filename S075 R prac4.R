my_data <- read.csv("C:/Users/Pranav Chaugule/Downloads/former_names.csv")
former_names <- read.csv("C:/Users/Pranav Chaugule/Downloads/former_names.csv")
View(former_names)
install.packages("dplyr")
install.packages("readr")

library(dplyr)
library(readr)

names_data <- read_csv("C:/Users/Pranav Chaugule/Downloads/former_names.csv")

head(names_data)

cat("Total records:", nrow(names_data), "\n")

unique_countries <- length(unique(names_data$current))
cat("Unique current country names:", unique_countries, "\n")

multiple_names <- names_data %>%
  group_by(current) %>%
  summarise(former_count = n()) %>%
  filter(former_count > 1)

cat("Countries with more than one former name:", nrow(multiple_names), "\n")
print(multiple_names)

names_data <- names_data %>%
  mutate(
    start_date = as.Date(start_date),
    end_date = as.Date(end_date),
    duration_days = as.numeric(end_date - start_date)
  )

head(names_data)

longest <- names_data %>% arrange(desc(duration_days)) %>% head(1)
cat("\nLongest time a former name was used:\n")
print(longest)

shortest <- names_data %>% arrange(duration_days) %>% head(1)
cat("\nShortest time a former name was used:\n")
print(shortest)

before_1900 <- names_data %>% 
  filter(start_date < as.Date("1900-01-01"))

cat("\nFormer names starting before 1900:", nrow(before_1900), "\n")
print(head(before_1900))

after_2000 <- names_data %>%
  

