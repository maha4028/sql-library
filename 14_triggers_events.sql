-- Triggers and Events

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

# Get the missing demographic from non-missing salary entry

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

# Test it how it automatically adds to dem table from sal table
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean', 'Sap', 'Entertainment', 1000000, NULL);

-- Events: scheduled automator
SELECT *
FROM employee_demographics;

# Delete anybody over the age of 60
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

# Check event_scheduler is ON
SHOW VARIABLES LIKE 'event%';