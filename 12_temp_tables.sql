-- Temporary tables

# Method 1
CREATE TEMPORARY TABLE temp_table
(
first_Name varchar(50),
last_Name varchar(50),
fav_movie varchar(100)
);

# Look its empty
SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Alex', 'Freburg', 'Lord of the Rings');

SELECT *
FROM temp_table;

# Method 2
SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM salary_over_50k;