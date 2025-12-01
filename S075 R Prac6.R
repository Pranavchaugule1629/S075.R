library(dplyr) # Load the library for bind_rows

# ------------------------------------------
# 1. SETUP: Create Two Simple Datasets
# ------------------------------------------
# Imagine these are two CSV files you downloaded.

# Dataset 1: Sales in January
# Contains: ID, Name, and Jan_Sales
data_jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Pratik", "Mihir", "Soham"),
  Jan_Sales = c(600, 750, 900)
)

# Dataset 2: Sales in February
# Contains: ID, Name, and Feb_Sales
data_feb <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Pratik", "Mihir", "Soham"),
  Feb_Sales = c(120, 160, 210)
)

# Dataset 3: New Employees (For appending example)
data_new_hires <- data.frame(
  ID = c(4, 5),
  Name = c("Vibhuti", "Saurav"),
  Jan_Sales = c(50, 60)
)

print("--- Data January ---")
print(data_jan)
print("--- Data February ---")
print(data_feb)

# ------------------------------------------
# 2. MERGE (Joining Columns)
# ------------------------------------------
# Scenario: You want to compare Jan and Feb sales for the same people.
# We match them by "ID" and "Name".

merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))

print("--- Merged Data (Columns Added) ---")
print(merged_data)


# ------------------------------------------
# 3. APPEND (Stacking Rows)
# ------------------------------------------
# Scenario: You want to add the new hires to the January list.
# We use bind_rows to stack them.

# Note: bind_rows automatically matches column names.
final_list <- bind_rows(data_jan, data_new_hires)

print("--- Appended Data (Rows Added) ---")
print(final_list)

