-- Limit & Aliasing

SELECT *
FROM employee_demographics
LIMIT 3
;

# 3 oldest employees
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

# only print the 3rd number
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1
;

-- Alising

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
