bats_df <- read.csv("C:/Users/mvlui/Downloads/bats_information.csv")
student_df <- read.csv("C:/Users/mvlui/Downloads/Student_Marks.csv")

lifespan_numeric <- as.numeric(sub(" .*", "", bats_df$Average.Lifespan))

bats_clean <- data.frame(
  Name = bats_df$Species,
  Value = lifespan_numeric
)

student_clean <- data.frame(
  Name = student_df$number_courses,
  Value = as.numeric(student_df$Marks)
)

combined_data <- rbind(bats_clean, student_clean)

cat("--- Combined Data Summary ---\n")
cat("Bats rows:", nrow(bats_clean), "\n")
cat("Students rows:", nrow(student_clean), "\n")
cat("Total rows:", nrow(combined_data), "\n")

cat("--- Preview of Combined Data (Top and Bottom) ---\n")
print(head(combined_data))
print(tail(combined_data))
