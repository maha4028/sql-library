-- Stored Procedures: reuse code over and over again

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

-- USE Park_and_Recreation;
CREATE PROCEDURE high_salary()
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

CALL high_salary();

DELIMITER $$
CREATE PROCEDURE high_salary2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL high_salary2();

# we can also store it in SCHEMAS left click new prodedure
CALL new_procedure()

# pass a parameter
DELIMITER $$
CREATE PROCEDURE high_salary3(employee_id1 INT)
BEGIN
	SELECT first_name, salary
	FROM employee_salary
	WHERE employee_id = employee_id1;
END $$
DELIMITER ;

CALL high_salary3(1);