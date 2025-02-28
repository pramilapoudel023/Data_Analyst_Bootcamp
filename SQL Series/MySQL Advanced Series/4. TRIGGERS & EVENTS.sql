-------------------- TRIGGERS AND EVENTS ------------------------

-- A trigger is a block of code that executes automatically when an event takes place on a specific table.alter

-------------------------- TRIGGERS ------------------------------

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
-- Creating a Trigger --
CREATE TRIGGER employee_insert
 -- AFTER a row is inserted into a employee_salary table
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
-- Insert values into the employee_demographics table
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Joanna', 'Smith', 'Entertainment 720 CEO', 1000000, NULL);


-------------------------- EVENTS ---------------------------------
-- Events is similar to Trigger, where Triggers happens when an event takes place 
-- Whereas an Event takes place when it's scheduled 

SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retiree
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE 
	FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

# When you couldn't create EVENTS

SHOW VARIABLES LIKE 'event%'


























