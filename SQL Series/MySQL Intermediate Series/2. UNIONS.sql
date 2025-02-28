----------------------- UNIONS -----------------------------

# UNION allows us to combine ROWS together
# It allows us to combine the ROWS of Data from Separate Tables or from the Same Table.
# UNION only Take Unique Values

-------------------------- SYNTAX ----------------------------------------
-- SELECT column_name(s) FROM table1
-- UNION
-- SELECT column_name(s) FROM table2;
--------------------------------------------------------------

-------------------- UNION/ UNION DISTINCT -------------------

# To return Distinct or Unique values in the table

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

-------------------- UNION ALL -------------------

# Returns all the records, without removing any of the duplicates

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

----------------------- USE CASE -------------------------------

# Let's say from the table employee_demographics, we want to take the first_name and last_name
# where the age is greater than than 50 and label them
# The Parks department is trying to cut their budget a little bit. They wanted to identify older employees
# they can push out and they also want to identify high paid employee they can reduce their pay or push them out 
# to save money.

SELECT first_name, last_name, 'OLD Man' AS label
FROM employee_demographics
WHERE age>40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'OLD Lady' AS label
FROM employee_demographics 
WHERE age>40 AND gender = 'Female'
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name
;




