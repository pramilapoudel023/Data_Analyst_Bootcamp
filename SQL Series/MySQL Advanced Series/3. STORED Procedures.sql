-------------------- STORED PROCEDURES ------------------------
CREATE PROCEDURE highest_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

CALL highest_salaries();

-------------------------- BEST PRACTICES ---------------------------

DELIMITER $$
CREATE PROCEDURE highest_salaries3()
BEGIN 
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL highest_salaries3();




--------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE highest_salaries4(p_employee_id INT)
BEGIN 
	SELECT salary
	FROM employee_salary
	WHERE employee_id = p_employee_id
    ;
END $$
DELIMITER ;

CALL highest_salaries4(1);





