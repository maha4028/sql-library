-- Unions

# row bind two columns
SELECT age, gender 
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name 
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name 
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'Old man' AS Label 
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old lady' AS Label 
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'High paid' AS Label 
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;