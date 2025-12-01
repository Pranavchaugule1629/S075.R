library(dplyr)

nutrition <- read.csv("C:/Users/mvlui/Downloads/Food_Nutrition_Dataset.csv")

print(head(nutrition, 3))
print(colnames(nutrition))

selected_cols <- nutrition %>%
  select(food_name, Calories, Protein_g)
print(head(food_name, 3))

range_cols <- nutrition %>%
  select(Calories:Fat_g)
print(head(range_cols, 3))

starts_with_s <- nutrition %>%
  select(starts_with("S"))
print(head(starts_with_s, 3))

dropped_one <- nutrition %>%
  select(-Sodium_mg)
print(names(dropped_one))

dropped_multiple <- nutrition %>%
  select(-Sugar_g, -Fat_g)
print(names(dropped_multiple))

dropped_range <- nutrition %>%
  select(-(Calories:Protein_g))
print(names(dropped_range))
