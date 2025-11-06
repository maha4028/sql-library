-- Group By

SELECT * FROM employee_demographics;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- Order By
SELECT *
FROM employee_demographics
ORDER BY gender, age 
;

# same thing with col. position index only for quick hand analyses
SELECT *
FROM employee_demographics
ORDER BY 5, 4 
;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000