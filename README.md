# London bike rides visualization
This project uses the London bike rides dataset on Kaggle to visualize insights and patterns
## Step 1: data cleaning using R
Packages used: dplyr, writexl
These below columns were renamed to facilitate the data analysis process
t1 -> real_temp_C
t2 -> temp_feel_like_C
hum -> humidity_percentage
wind_speed -> wind_speed_kph
weather_code -> weather

The weather and season columns use numeric codes to describe data, I changed them into string as descriptive labels are immediately understandable to the audience, making the visualization more accessibleand easily interpreted
I also divide the value in humid column for 100 to show the humidity percentage
The package writexl is used to write the new data frame into an excel file called cleaned_data.xlsx

## Step 2: data visualization using Tableau
- I created 2 new parameters: moving average duration and moving average period which allow users to interact with and dynamically change the moving average calculation in the visualization. The moving average period parameter let users switch the granularity of the moving average from days to weeks or months, providing different perspectives on the data
- The "Moving Average Period Set" was created to dynamically control which data points are included in the moving average calculation. It is useful in this dashboard where the user might want to focus on specific periods within the data.
- A max month and min month calculation were performed, then an "in range" boolean calculation is used to create a true/false flag indicating whether each record falls within a specified date range. This calculated field is dragged to the Color shelf in Tableau, which will color the marks differently based on whether they fall within the range (TRUE) or not (FALSE).
- To count the total ride within the chosen range, I used the in range calculation again to count only the bike rides that fall within the specified date range: { SUM(INT([In range]) * [Count]) } in which int[IN RANGE] is 0 or 1
- A heatmap is created to visualize the sum of bike rides in London in different conditions of wind vs temperature. The visualization is also filtered with the in-range calcultion
- A count of total bike rides in different time (hour) and weather is also created and added as a tooltips to other visualization

## Step 3: build Tableau dashboard
### The final dashboard contains these below charts:
- 30-Day Moving Average Line Chart: Shows the trend of bike rides over time with a 30-day moving average to smooth out daily fluctuations. There is a control for users to modify the moving average duration and select a specific time period on the timeline.
- Total Bike Rides: shows the total count of bike rides during the specified period.
- Temperature vs Wind heatmap: Presents a heatmap that cross-tabulates temperature ranges (in °C) with wind speed ranges (in Kph). Each cell in the matrix is color-coded and contains the number of bike rides for the corresponding temperature and wind speed range. The darker shades likely represent a higher number of rides, indicating that certain weather conditions may correlate with the frequency of bike rides.
- The dashboard's interactive elements suggest that it's designed to offer users the ability to delve deeper into the data based on their specific interests or questions.
Click here to view the visualization: https://public.tableau.com/authoring/Londonbikerides_17126703668710/Dashboard1#1
