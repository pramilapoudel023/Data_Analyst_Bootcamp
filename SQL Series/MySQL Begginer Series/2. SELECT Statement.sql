SELECT * 
FROM Parks_and_Recreation.employee_demographics;

# SQL Follows PEMDAS rule
#PEMDAS (Parentheses, Exponent, Multiplication, Division, Addition, Subtraction) 

# SQL processes queries in the order: 
#FROM, JOIN, WHERE, GROUP BY, HAVING, SELECT, DISTINCT, ORDER BY, and finally, LIMIT/OFFSET

SELECT 
first_name, 
last_name, 
birth_date,
age,
age + 10 
FROM Parks_and_Recreation.employee_demographics;

SELECT DISTINCT first_name, gender
FROM Parks_and_Recreation.employee_demographics;