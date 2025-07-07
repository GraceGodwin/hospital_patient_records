-- Making schema active 
USE hospital_patient_records;

SELECT *
FROM hospital_dataset;

-- Business Questions 
-- 1. Retrieve records of patients with length of stay greater than 7 days.
SELECT *
FROM hospital_dataset
WHERE Length_of_Stay > 7; 

-- 2. Find the average treatment cost across all patients.
SELECT  ROUND(AVG(Treatment_Cost),2)
FROM hospital_dataset;

-- 3. Count how many patients were treated in each department.
SELECT  Department, COUNT(Patient_ID)
FROM hospital_dataset
GROUP BY Department;

-- 4. Determine the most frequent diagnoses. 
SELECT Diagnosis, COUNT(Patient_ID) AS Frequency
FROM hospital_dataset
GROUP BY  Diagnosis
ORDER BY Frequency DESC
LIMIT 1;

-- 5. Count male and female patients in each department. 
SELECT Department, Gender, COUNT(Patient_ID) AS Patient_count
FROM hospital_dataset
GROUP BY Department, Gender;

-- 6. Calculate the average stay duration by diagnosis.
SELECT  Diagnosis, AVG(Length_of_Stay) AS Average_stay
FROM hospital_dataset
GROUP BY Diagnosis
ORDER BY Average_stay DESC;

-- 7. Identify departments with average treatment cost above 5000.
SELECT  Department, ROUND(AVG(Treatment_Cost),2)
FROM hospital_dataset
GROUP BY Department
HAVING AVG(Treatment_Cost) > 5000;

-- 8. Count patient admissions by month. 
SELECT MONTHNAME(Admission_Date) AS Month, COUNT(Patient_ID)
FROM hospital_dataset
GROUP BY Month
ORDER BY FIELD(Month, 'January','February','March','April','May','June','July','August','September','October','November','December');

-- 9. Categorize patients by age group using credit logic. 
SELECT
CASE
WHEN Age < 18 THEN 'Child'
WHEN Age BETWEEN 18 AND 35 THEN 'Youth'
WHEN Age BETWEEN 36 AND 59 THEN 'Adult'
ELSE 'Elder'
END AS Age_group,
COUNT(Patient_ID)AS Patient_Count 
FROM hospital_dataset
GROUP BY Age_group;
 
-- 10. Find the earliest and latest admission dates for each department.
SELECT Department, MIN(Admission_Date) AS Earliest_Admission, MAX(Admission_Date) AS Latest_Admission
FROM hospital_dataset
GROUP BY Department;

-- 11. Identify the department with the highest average length of stay.
SELECT Department, AVG(Length_of_Stay)
FROM hospital_dataset
GROUP BY Department
ORDER BY AVG(Length_of_Stay) DESC
LIMIT 1;

-- 12. Determine the total treatment cost attributed to each doctor. 
SELECT Doctor, SUM(Treatment_Cost) AS Total_cost
FROM hospital_dataset
GROUP BY Doctor
ORDER BY Total_cost DESC;

-- 13. List all patients discharged after more than 10 days.
SELECT Patient_ID, Length_of_Stay
FROM hospital_dataset
WHERE Length_of_Stay > 10;

-- 14. Find diagnoses with the highest average treatment cost.
SELECT  Diagnosis, ROUND(AVG(Treatment_Cost),2)
FROM hospital_dataset
GROUP BY Diagnosis
ORDER BY AVG(Treatment_Cost) DESC
LIMIT 1;

-- 15. Count how many patients each doctor has treated.
SELECT Doctor, COUNT(Patient_ID)
FROM hospital_dataset
GROUP BY Doctor
ORDER BY COUNT(Patient_ID) DESC;
