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
