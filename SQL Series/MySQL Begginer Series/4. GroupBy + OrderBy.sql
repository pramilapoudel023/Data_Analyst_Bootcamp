-- GROUP BY  and ORDER BY--

-- SYNTAX. --
## SELECT column_name(s)    #The column_name passed in this line
## FROM table_name
## WHERE condition
## GROUP BY column_name(s)  # Should match with the column_name passed in this line, if the aggregate functions is not used in SELECT Statement
## ORDER BY column_name(s);

----------------------------------------------------------------------------------------------------------------------------------------------------

-- GROUP BY --
# Group By statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result set by one or more columns.

SELECT *
FROM employee_demographics;


-- GROUP BY employees first_name --
SELECT first_name
FROM employee_demographics
GROUP BY first_name;


# GROUP BY using the aggregate function

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender; 

------------------------------------------------------------------------------------------------------------------------------------------------------

-- ORDER BY --
-- ORDER BY is used to Sort the result-set in ascending or descending order --
-- Order of the ORDER BY or the columns that you place in the ORDER by is very important.

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

-- ORDER BY using column name/ position of the fields --
-- Not Recommended. It will create issues if you were to add any columns or remove columns , then we'd be ordering by the wrong column.
 
SELECT *
FROM employee_demographics
ORDER BY 5, 4 ;


