-- Case Statements

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN  31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN 'Very old'
END AS age_bracket
FROM employee_demographics
;

# Pay bonuses and increase
# <50k, 5% raise
# >50k, 7% raise
# Fin. Dept., 10% bonus
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS bonus
FROM employee_salary
;

SELECT *
FROM employee_salary;
SELECT *
FROM pks_departments;
