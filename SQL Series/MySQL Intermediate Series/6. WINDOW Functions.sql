-------------------- WINDOW FUNCTIONS -------------------------

-- GROUP BY Example --
-- group by rolls up everything up into one row

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
			ON dem.employee_id = sal.employee_id
GROUP BY gender
;

--  WINDOWS FUNCTION Example --
-- Group By rolled up everything up in one row, but the windows function will not roll up everything in one row
-- It will perform the calculation based off of the genders, the unique values of this column.alter


SELECT gender, AVG(salary) OVER(PARTITION BY(gender))
FROM employee_demographics dem
JOIN employee_salary sal
			ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, dem.last_name,gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
			ON dem.employee_id = sal.employee_id
;

-----------------------------------------------------------------------------------
-- ROW_NUMBER(), RANK(), DENSE_RANK()--
-- ROW_NUMBER() -> Returns a row number based off of partition by or ordering by in your window function
-- RANK() -> Returns the rank of each row within the partition of a result set. 
--        -> RANK provides the same numeric value for ties (for example 1, 2, 2, 4, 5)
-- DENSE_RANK() -> Returns the rank of each row within a result set partition, with no gaps in the ranking values.

SELECT dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY Salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY Salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY Salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
			ON dem.employee_id = sal.employee_id
;


