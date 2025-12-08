
library(dplyr)
library(tidyr)

# 1. SETUP: Read student marks data and add StudentID
df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv", na.strings = c("", "NA")) %>%
  mutate(StudentID = row_number()) %>%
  select(StudentID, number_courses, time_study, Marks)

print("--- 1. Original Wide Data ---")
print(head(df))

# 2. PIVOT_LONGER: Stack study metrics and marks into long format
long_df <- df %>%
  pivot_longer(
    cols = c(number_courses, time_study, Marks),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 9))  # show first 9 rows (3 metrics per student)

# 3. PIVOT_WIDER: Spread back to wide format
wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

# 4. ADVANCED EXAMPLE: Pivot by number_courses to see Marks distribution
category_pivot <- df %>%
  select(StudentID, number_courses, Marks) %>%
  pivot_wider(
    names_from = number_courses,
    values_from = Marks
  )

print("--- 4. Course Pivot (Spreading number_courses) ---")
print(head(category_pivot))