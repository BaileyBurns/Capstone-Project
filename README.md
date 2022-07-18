# Capstone-Project
### An analysis of Fitbit data to provide insights on future marketing and business decisions

## Visualization of the project in Tableau can be seen here:
https://public.tableau.com/app/profile/bailey.burns/viz/GoogleDataVizSQLTableau/Top5Bottom5CalorieBurners

## The Task
Bellabeat, a company that creates health related smart products, has asked for insights on consumer data in hopes to create opportunities for the marketing team to expand upon. Bellabeat's products focus on activity, sleep, and stress monitoring for women. They would like to know how non-Bellabeat customers use smart devices for their health.

## Cleaning the data
Please look at my other file containing the SQL code used to clean the data. Some issues were found while cleaning the data. One being there were some duplicate rows that were removed in order to maintain an accurate analysis. Also, out of the 33 participants in the data, only 8 were actually logging their weight. This changed how I would go about analyzing since I didn't feel the weight information contained enough participants to utilize the data from that CSV file.

## Analysis
I analyzed the data using SQL through Google's BigQuery. The Script can be found in my Final Code page in github.

## Insights
Through my analysis I was able to find the behaviors of the top 5 calorie burners compared to the bottom 5 calorie burners. My visualization on tableau shows how their overall daily activities differ. The end result of their differing activities directly results in their big differences in calories burned. I found that the top 5 calorie burners overall averaged far few sedentary minutes per day compared to the bottom 5. Bellabeat can use the information in my visualization to improve their product in a few different ways. One recommendation would be to add a feature in their product that could send a notification to the customers device when they have reached over X amount minutes spent sedentary. This would improve overall performance of the customer by helping them achieve the ideal activity to reach their physical goals. Another insight from the analysis found that the top 5 calorie burners all spent a large amount of time in a fairly active state. Bellabeat could create a section in their app with a detailed list of workouts that would keep them in the fairly active activity range.
