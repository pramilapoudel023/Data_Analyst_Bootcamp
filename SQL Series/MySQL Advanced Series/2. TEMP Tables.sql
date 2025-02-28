-------------------- TEMPORARY Tables ------------------------

-- Temporary tables are tables that are only visible to the session table they are created in
-- It helps storing temporary data without affecting the underlying permanent tables.
-- Temporary tables are automatically deleted after session completed or you exit out of SQL.
-- It allows users to store and manipulate temporary data within a specific session, thereby simplifying a complex queries.

-------------- There are 2 ways to create a Temp table -----------------

CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES ("John", "Doe", "Harry Potter");


SELECT *
FROM temp_table;


----------------------------------------------------------------

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;


SELECT *
FROM salary_over_50k;











