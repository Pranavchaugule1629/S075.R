my_data <- read.csv("C:/Users/Pranav Chaugule/OneDrive/Documents/former_names.csv")
former_names <- read.csv("C:/Users/Pranav Chaugule/OneDrive/Documents/former_names.csv")
View(former_names)

install.packages(c("readr", "psych"))

library(readr)
library(psych)

my_data <- read.csv("C:/Users/Pranav Chaugule/OneDrive/Documents/former_names.csv")

head(my_data)
tail(my_data)

dim(my_data)
cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

str(my_data)

summary(my_data)

names(my_data)
cat("Column Names: ", names(my_data), "\n")

describe(my_data)




