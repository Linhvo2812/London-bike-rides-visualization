#read the csv file
data <- read.csv('london_merged.csv')

# Print the data frame
print(data)

#rename the column
library(dplyr)
data <- data %>% 
  rename(real_temp_c = t1,
         temp_feel_like_c = t2,
         humidity_percentage = hum,
         wind_speed_kph = wind_speed,
         weather = weather_code)

#change value in season col
data <- data %>% 
  mutate(season = case_when(
    season == 0 ~ "spring",
    season == 1 ~ "summer",
    season == 2 ~ "fall",
    season == 3 ~ "winter"
  ))

#change value in weather col
data <- data %>% 
  mutate(weather = case_when(
    weather == 4 ~ "cloudy",
    weather == 1 ~ "clear",
    weather == 2 ~ "scattered clouds",
    weather == 3 ~ "broken clouds",
    weather == 7 ~ "rain",
    weather == 10 ~ "rain with thunderstorm",
    weather == 26 ~ "snowfall"
  ))

#divide humidity percentage for 100
data <- data %>%
  mutate(humidity_percentage = humidity_percentage/100)


# Install the writexl package if you haven't already
install.packages("writexl")

# Load the writexl package
library(writexl)

# Write the dataframe to an Excel file
write_xlsx(data, "cleaned_data.xlsx")
