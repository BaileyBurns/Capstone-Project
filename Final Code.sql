--Confirming the number of users in the overall study:
SELECT
DISTINCT (Id)
FROM `bellabeatdata-354522.bellabeat.daily_activity`
-- 33 unqiue ID's in this study

--Selecting the number of participants who logged their sleep
SELECT
DISTINCT (Id)
FROM `bellabeatdata-354522.bellabeat.sleep_activity`
-- 24 unique IDs logged their sleep

--Selecting the number of participants who logged their weight
SELECT
DISTINCT (Id)
FROM `bellabeatdata-354522.bellabeat.weight_loss`
-- 8 unique IDs logged their weight

-- Determining the start date for each table
SELECT
MIN(ActivityDate) AS start_date,
MAX(ActivityDate) AS end_date
FROM `bellabeatdata-354522.bellabeat.daily_activity`
-- Start Date: 4/12/2016 and End Date: 5/12/2016

-- Making sure there are no duplicate rows
SELECT Id, ActivityDate,
COUNT(*) AS number_of_rows
FROM `bellabeatdata-354522.bellabeat.daily_activity`
GROUP BY Id, ActivityDate
HAVING number_of_rows > 1
-- This shows there are no duplicates in this table

-- Making sure there are no duplicate rows
SELECT 
COUNT (*) AS number_of_rows
FROM `bellabeatdata-354522.bellabeat.sleep_activity`
GROUP BY Id, SleepDay
HAVING number_of_rows > 1
-- This is showing there are 3 duplicate rows

-- Creating new table without the duplicate rows
CREATE TABLE bellabeatdata-354522.bellabeat.sleep_activity_2 AS 
SELECT DISTINCT *
FROM `bellabeatdata-354522.bellabeat.sleep_activity`

-- Double checking our new table has no duplicate rows
SELECT 
COUNT (*) AS number_of_rows
FROM `bellabeatdata-354522.bellabeat.sleep_activity_2`
GROUP BY Id, SleepDay
HAVING number_of_rows > 1
-- Confirmed that the duplicates are removed

-- Making sure there are no duplicate rows
SELECT Id, Date,
COUNT(*) AS number_of_rows
FROM `bellabeatdata-354522.bellabeat.weight_loss`
GROUP BY Id, Date
HAVING number_of_rows > 1
-- This shows there are no duplicates in this table

-- End data cleaning

-- Discovering what the top 5 calorie burners averaged for activity minutes
SELECT
Id,
AVG(Calories) AS average_calories,
AVG(VeryActiveMinutes) AS average_very_active_minutes,
AVG(FairlyActiveMinutes) AS average_fairly_active_minutes,
AVG(LightlyActiveMinutes) AS average_lightly_active_minutes,
AVG(SedentaryMinutes) AS average_sedentary_minutes,
FROM `bellabeatdata-354522.bellabeat.daily_activity`
GROUP BY Id
ORDER BY average_calories DESC
LIMIT 5
-- This gives me the habits of the top 5 burners to understand their patterns

-- Now I can run the same script to find the bottom 5 calorie burners
SELECT
Id,
AVG(Calories) AS average_calories,
AVG(VeryActiveMinutes) AS average_very_active_minutes,
AVG(FairlyActiveMinutes) AS average_fairly_active_minutes,
AVG(LightlyActiveMinutes) AS average_lightly_active_minutes,
AVG(SedentaryMinutes) AS average_sedentary_minutes,
FROM `bellabeatdata-354522.bellabeat.daily_activity`
GROUP BY Id
ORDER BY average_calories 
LIMIT 5
-- This will be important to analyze the behaviors of low calorie burners in order to provide recommendations to Bellabeat

-- Taking the average of how much a user slept vs the time they spent in bed to then compare to their activity minutes
SELECT Id, AVG(TotalMinutesAsleep / TotalTimeInBed) AS percent_time_asleep
FROM `bellabeatdata-354522.bellabeat.sleep_activity_2`
GROUP BY Id

-- By joining the activity table with the sleep table we can get a clear picture on how various activity minutes may impact sleep
SELECT
d.Id,
s.Id,
AVG(Calories) AS average_calories,
AVG(VeryActiveMinutes) AS average_very_active_minutes,
AVG(FairlyActiveMinutes) AS average_fairly_active_minutes,
AVG(LightlyActiveMinutes) AS average_lightly_active_minutes,
AVG(SedentaryMinutes) AS average_sedentary_minutes,
AVG(TotalMinutesAsleep / TotalTimeInBed) AS percent_time_asleep 
FROM `bellabeatdata-354522.bellabeat.daily_activity` AS d
JOIN `bellabeatdata-354522.bellabeat.sleep_activity_2` AS s
ON d.Id = s.Id
GROUP BY d.Id,s.Id
ORDER BY average_calories DESC
