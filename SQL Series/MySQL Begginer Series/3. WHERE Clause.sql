-- WHERE Clause

SELECT *
FROM employee_salary
WHERE salary >= 50000;


SELECT *
FROM employee_demographics
WHERE gender != 'Female';



-- AND, OR, NOT -- Logical Operators

SELECT *
FROM employee_demographics
WHERE birth_date > '1980-01-01' 
AND gender = 'Female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1980-01-01' 
OR gender = 'Female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1980-01-01' 
OR NOT gender = 'Female';

SELECT *
FROM employee_demographics
WHERE (first_name = "Leslie" AND age = 44) OR age >55;

-- LIKE STATEMENT -- It looks for a specific sequence within a column that we are seraching for 
				-- It doesn't have to be exact match as long as specified sequence is in there anywhere within the cell/column
-- We can add % and _ characters within our LIKE Statement
SELECT * 
FROM employee_demographics
WHERE first_name LIKE '%jer%';


SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__'  ;  # i.e the word starts with an a with two characters after it

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__%' ;   # i.e the word starts with an a with two characters after it and it can have anything after that

SELECT * 
FROM employee_demographics
WHERE birth_date LIKE '1989%' ;  
