-- Find the employee count
SELECT sum(employee_count) as employee_count
FROM hr_data;
-- WHERE education= "High school"
-- WHERE department = 'R&D'
-- WHERE education_field = 'Medical'

-- Find the attrition count
SELECT count(attrition) as attrition_count
FROM hr_data
WHERE attrition= 'Yes';

-- Find attrition rate 
SELECT round((SELECT count(attrition) from hr_data where attrition= 'Yes' and department= 'R&D')*100 / sum(employee_count),2) as attrition_rate
FROM hr_data
where department= 'R&D';

-- Find active employees
SELECT sum(employee_count)-(SELECT count(attrition) from hr_data where attrition= 'Yes') as active_employees
FROM hr_data;

-- Find average age
SELECT round(avg(age),0) as avg_age
FROM hr_data;

-- Find attrition by Gender
SELECT Gender, count(Attrition) as attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY count(Attrition) DESC;

-- Department wise Attrition
SELECT Department, count(Attrition) as attrition_count, 
	   round(count(attrition)*100/ 
       (Select count(attrition) 
       from hr_data 
       where Attrition = 'Yes'),2) as percentage 
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY count(Attrition) DESC;

-- Number of employee by age group
SELECT age, sum(employee_count)
FROM hr_data
GROUP BY age
ORDER BY age;

-- Education Field wise Attrition
SELECT Education_field, count(attrition) as attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY Education_field
ORDER BY attrition_count;

-- Attrition Rate by Gender for different Age Group
SELECT age_band,Gender, Count(attrition) as attrition_count,
round(count(attrition)*100/ 
(SELECT count(attrition) 
from hr_data 
where attrition= 'Yes'),2) as '%'
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY Gender, age_band
ORDER BY age_band,Gender;










