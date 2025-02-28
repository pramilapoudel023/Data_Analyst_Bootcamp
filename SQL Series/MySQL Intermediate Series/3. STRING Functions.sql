----------- STRING FUNCTIONS -----------------

# String Functions are built-in functions within MySQL that will help us use Strings and work with Strings differently

-------------------- LENGTH -------------------

# Returns the length of a string
SELECT LENGTH('skyfall');  

# Returns the length of employees first name and Order By the length from shortest name to the longest name
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-------------------- UPPER/LOWER ---------------

# Useful for standardization of data
SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT first_name, LOWER(first_name)
FROM employee_demographics;


------------------- TRIM -------------------------

# Removes leading and trailing whitespace 

SELECT TRIM('      SKY        ');
SELECT LTRIM('      SKY        ');    # To remove leading whitespace only
SELECT RTRIM('      SKY        ');    # To remove trailing whitespace only


----------------- SUBSTRING ----------------------

SELECT first_name,
LEFT (first_name, 4),
RIGHT (first_name, 4),
SUBSTRING(first_name,3, 2),
birth_date,
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;


----------------------- REPLACE -----------------------

# REPLACE will replace a specific characters with a different characters

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;


----------------------- LOCATE --------------------------

# Returns a position of a character in a string
SELECT LOCATE('e', 'Leslie');


SELECT first_name, LOCATE('AN',first_name)
FROM employee_demographics;


-------------------- CONCATENATION ----------------------

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee_demographics;


