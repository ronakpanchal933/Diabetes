select * from diabetesdataset;

-- 1. Select all columns from the DiabeticData table
SELECT * FROM diabetesdataset d ;

-- 2. Select unique outcomes and their counts
SELECT "Outcome" , COUNT(*) AS Count
FROM diabetesdataset d 
GROUP BY "Outcome";

-- 3. Select average glucose level for each outcome
SELECT "Outcome", AVG("Glucose") AS AvgGlucose
FROM diabetesdataset d 
GROUP BY "Outcome";

-- 4. Select records where BMI is greater than 30
SELECT *
FROM diabetesdataset d 
WHERE "BMI"  > 30;

-- 5. Count the number of pregnancies for each age group
SELECT "Age"   , COUNT("Pregnancies") AS NumPregnancies
FROM diabetesdataset
GROUP BY "Age";

-- 6. Calculate the average BMI for different age groups using a window function
SELECT Age, AVG(BMI) OVER (PARTITION BY Age) AS AvgBMI
FROM DiabeticData;

-- 7. Find the maximum glucose level for each outcome
SELECT Outcome, MAX(Glucose) AS MaxGlucose
FROM DiabeticData
GROUP BY Outcome;

-- 8. Calculate the percentage of diabetic outcomes
SELECT Outcome, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM DiabeticData) AS Percentage
FROM DiabeticData
GROUP BY Outcome;

-- 9. Use a subquery to find records with BMI greater than the average BMI
SELECT *
FROM DiabeticData
WHERE BMI > (SELECT AVG(BMI) FROM DiabeticData);

-- 10. Rank records based on DiabetesPedigreeFunction in descending order
SELECT *, RANK() OVER (ORDER BY DiabetesPedigreeFunction DESC) AS Rank
FROM DiabeticData;

-- 11. Find the average age for each outcome, excluding records with age less than 18
SELECT Outcome, AVG(Age) AS AvgAge
FROM DiabeticData
WHERE Age >= 18
GROUP BY Outcome;

-- 12. Identify records where insulin is missing
SELECT *
FROM DiabeticData
WHERE Insulin IS NULL;

-- 13. Calculate the percentage of outcomes with pregnancies greater than 5
SELECT Outcome, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM DiabeticData WHERE Pregnancies > 5) AS Percentage
FROM DiabeticData
WHERE Pregnancies > 5
GROUP BY Outcome;

-- 14. Use a subquery to find records with the highest BMI
SELECT *
FROM DiabeticData
WHERE BMI = (SELECT MAX(BMI) FROM DiabeticData);

-- 15. Calculate the cumulative count of records based on age using a window function
SELECT Age, COUNT(*) OVER (ORDER BY Age) AS CumulativeCount
FROM DiabeticData;

-- 16. Find the average glucose level for each age group, ordered by age
SELECT Age, AVG(Glucose) AS AvgGlucose
FROM DiabeticData
GROUP BY Age
ORDER BY Age;

-- 17. Identify records where SkinThickness is greater than BloodPressure
SELECT *
FROM DiabeticData
WHERE SkinThickness > BloodPressure;

-- 18. Calculate the difference in age between each record and the maximum age
SELECT Age, MAX(Age) - Age AS AgeDifference
FROM DiabeticData
GROUP BY Age;

-- 19. Use a subquery to find records with the lowest BMI
SELECT *
FROM DiabeticData
WHERE BMI = (SELECT MIN(BMI) FROM DiabeticData);

-- 20. Calculate the average BloodPressure for each outcome, excluding records with BloodPressure less than 60
SELECT Outcome, AVG(BloodPressure) AS AvgBloodPressure
FROM DiabeticData
WHERE BloodPressure >= 60
GROUP BY Outcome;

-- 21. Identify records where both Glucose and Insulin values are available
SELECT *
FROM DiabeticData
WHERE Glucose IS NOT NULL AND Insulin IS NOT NULL;

-- 22. Find the age group with the highest average BMI
SELECT Age, AVG(BMI) AS AvgBMI
FROM DiabeticData
GROUP BY Age
ORDER BY AvgBMI DESC
LIMIT 1;

-- 23. Calculate the percentage of outcomes with DiabetesPedigreeFunction greater than 0.5
SELECT Outcome, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM DiabeticData WHERE DiabetesPedigreeFunction > 0.5) AS Percentage
FROM DiabeticData
WHERE DiabetesPedigreeFunction > 0.5
GROUP BY Outcome;

-- 24. Use a subquery to find records with the highest Glucose level
SELECT *
FROM DiabeticData
WHERE Glucose = (SELECT MAX(Glucose) FROM DiabeticData);

-- 25. Calculate the running total of pregnancies using a window function
SELECT Pregnancies, SUM(Pregnancies) OVER (ORDER BY Age) AS RunningTotalPregnancies
FROM DiabeticData;
