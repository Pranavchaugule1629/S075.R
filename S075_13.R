library(dplyr)

bats_df <- read.csv("C:/Users/mvlui/Downloads/bats_information.csv")

bats_clean <- data.frame(
  Name = bats_df$Species,
  Value = as.numeric(sub(" .*", "", bats_df$Average.Lifespan))
)

print("--- Original Data ---")
print(bats_clean)

duplicates_report <- bats_clean %>%
  group_by(Name, Value) %>%
  count() %>%
  filter(n > 1)

print("--- Duplicate Rows ---")
print(duplicates_report)

clean_exact <- bats_clean %>%
  distinct()

print("--- Exact Duplicates Removed ---")
print(clean_exact)

unique_names <- bats_clean %>%
  distinct(Name, .keep_all = TRUE)

print("--- Unique Names Only ---")
print(unique_names)
