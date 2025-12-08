install.packages("lubridate")
library(lubridate)
library(dplyr)

dates_df <- data.frame(
  Event_ID = 1:4,
  Date_String = c("2023-01-15", "2023-10-31", "2024-02-29", "2024-12-25")
)

processed_data <- dates_df %>%
  mutate(
    Actual_Date = ymd(Date_String),
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date)
  )

print("--- Data with Extracted Date Components ---")
print(processed_data)

current_time <- now()

print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
