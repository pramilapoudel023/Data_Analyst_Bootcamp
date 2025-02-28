-- LIMIT & ALIAS --
-- LIMIT specifies how may rows you want in your output --

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;


SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1      ## We will start at position 1 and then we're gonna go 1 row after it
;


------------------------------------------------------------------------------------------------------------------------------------

-- ALIAS --
-- Used to make column name more readable
-- AS keyword is optional 

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age> 40;

-- we can write this way as well
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age> 40;
