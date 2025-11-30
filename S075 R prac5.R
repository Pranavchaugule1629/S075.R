BostonHousing <- read.csv("C:/Users/Pranav Chaugule/Downloads/BostonHousing.csv")
View(BostonHousing)
library(dplyr)

boston <- read.csv("C:/Users/Pranav Chaugule/Downloads/BostonHousing.csv")

boston_sorted_medv <- boston |>
  arrange(medv)

head(boston_sorted_medv, 5)

boston_sorted_crim_desc <- boston |>
  arrange(desc(crim))

head(boston_sorted_crim_desc, 5)

boston_multi_sort <- boston |>
  arrange(chas, desc(medv))

head(boston_multi_sort, 10)

large_homes_by_tax <- boston |>
  filter(rm > 8) |>
  arrange(tax)

cat("Top 5 largest homes by lowest tax rate:\n")
print(large_homes_by_tax |> select(rm, tax, medv) |> head(5))
