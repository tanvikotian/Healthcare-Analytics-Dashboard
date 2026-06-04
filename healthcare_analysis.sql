CREATE DATABASE healthcare_analytics;
USE healthcare_analytics;
SHOW tables;

-- Basic Overview Queries

-- Total Patients
SELECT COUNT(*) AS Total_Patients
FROM healthcare_dataset;

-- Average Billing Amount
SELECT ROUND(AVG(`Billing Amount`),2) AS Avg_Billing
FROM healthcare_dataset;

-- Total Revenue
SELECT ROUND(SUM(`Billing Amount`),2) AS Total_Revenue
FROM healthcare_dataset;

-- Medical Analysis

-- Most Common Medical Conditions
SELECT `Medical Condition`,
       COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Patient_Count DESC;

-- Patients by Gender
SELECT Gender,
       COUNT(*) AS Total
FROM healthcare_dataset
GROUP BY Gender;

-- Blood Type Distribution
SELECT `Blood Type`,
       COUNT(*) AS Total
FROM healthcare_dataset
GROUP BY `Blood Type`
ORDER BY Total DESC;

-- Financial Analysis

-- Revenue by Hospital
SELECT Hospital,
       ROUND(SUM(`Billing Amount`),2) AS Revenue
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY Revenue DESC;

-- Average Billing by Insurance Provider
SELECT `Insurance Provider`,
       ROUND(AVG(`Billing Amount`),2) AS Avg_Bill
FROM healthcare_dataset
GROUP BY `Insurance Provider`
ORDER BY Avg_Bill DESC;

--  Doctor Analysis
-- Doctors Handling Most Patients
SELECT Doctor,
       COUNT(*) AS Patients
FROM healthcare_dataset
GROUP BY Doctor
ORDER BY Patients DESC
LIMIT 10;

-- Which diseases generate the highest average bills?
SELECT `Medical Condition`,
       ROUND(AVG(`Billing Amount`),2) AS Avg_Bill
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Avg_Bill DESC
LIMIT 5;

-- Patient distribution by age category.
SELECT
CASE
    WHEN Age < 18 THEN 'Child'
    WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
    WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
    WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult'
    ELSE 'Senior Citizen'
END AS Age_Group,
COUNT(*) AS Patients
FROM healthcare_dataset
GROUP BY Age_Group;

-- Most Common Condition for Each Gender
SELECT Gender,
       `Medical Condition`,
       COUNT(*) AS Total_Patients
FROM healthcare_dataset
GROUP BY Gender, `Medical Condition`
ORDER BY Gender, Total_Patients DESC;

-- Highest Revenue Medical Condition
SELECT `Medical Condition`,
       ROUND(SUM(`Billing Amount`),2) AS Revenue
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Revenue DESC
LIMIT 1;