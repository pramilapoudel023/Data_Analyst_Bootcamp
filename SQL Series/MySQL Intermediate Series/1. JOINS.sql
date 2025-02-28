-------- JOINS -----------
# A JOIN clause in SQL allows you to combine two tables or more together if they have a common columns
# The column name doesnot have to be the exact same but atleast the data within it are similar that we can use

----------------------------- Types of JOINS -------------------------------------
-- 1. INNER JOIN -> Returns records that have matching value in both tables
-- 2. OUTER(LEFT) JOIN -> Returns all Records from the LEFT Table and Matched Records from the RIGHT Table.
-- 3. OUTER(RIGHT) JOIN -> Returns all Records from the RIGHT Table and Matched Records from the LEFT Table.
-- 4. FULL JOIN -> Returns all Records when there is a match in either LEFT or RIGHT Table. 
-- 5. SELF JOIN -> SELF JOIN is a regular JOIN, but the Table is JOINED with itself


SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;

-------------- INNER JOIN -------------
# By Default JOIN represents an INNER JOIN

SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;

# Selecting Actual Columns
SELECT dem.employee_id, age, occupation 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;


----------------- OUTER JOIN ------------------

----------- LEFT OUTER JOIN -------------------
SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;


----------- RIGHT OUTER JOIN --------------------
SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;

-------------- SELF JOIN ------------------------

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id = emp2.employee_id
;


# USE CASE -> Let's say it's DECEMBER 1st and everyone in the company decided to do a secrect santa 
#             and they wanted to assign based off of their employee_id the person who they are going 
#             to have as a secrect santa.

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1 = emp2.employee_id
;


# Specify the Column to Simplify the Output

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id + 1 = emp2.employee_id
;


----------------- Joining Multiple Tables Together ---------------------

SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
ON sal.dept_id = pd.department_id
;




