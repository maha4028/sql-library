-- Subqueries

# In WHERE
SELECT *
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1)
;

# In SELECT
SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
GROUP BY first_name, salary
;

# In From
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

# want average of max ages grouped over gender e.g.
SELECT AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table
;

# want average of max ages e.g.
SELECT AVG(max_age)
FROM
(SELECT gender,
 AVG(age) AS avg_age, 
 MAX(age) AS max_age, 
 MIN(age) AS min_age, 
 COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table
;