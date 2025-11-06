SELECT *
FROM pandr.employee_demographics;

SELECT first_name, 
last_name,
birth_date,
age,
(age + 10)*10 + 10
FROM pandr.employee_demographics;
# PEMDAS

SELECT DISTINCT first_name, gender
FROM pandr.employee_demographics;
