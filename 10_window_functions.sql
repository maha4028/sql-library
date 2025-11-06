-- Window function

# using group by
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

# using window function
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# rolling sum
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS roll_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Row number, rank, dense rank

# row number
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# row number over gender (with repeats)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# row number over gender with number by highest salary
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# control for ties and skips one of the tied numbers!
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# controls for ties and doesnt skip the tied numbers
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;