-- HAVING vs WHERE --
-- HAVING clause was added to SQL because the WHERE Keyword cannot be used with aggregate functions --
-- If you want to use filter on Aggregated Function, then we use HAVING Clause

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


SELECT Occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'    ## Filtering at the Row Level
GROUP BY occupation
HAVING AVG(salary) >75000;           ## Filter at the aggregate function Level

