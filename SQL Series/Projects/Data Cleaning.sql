-- Data Cleaning


SELECT *
FROM layoffs;


-- 1. Check or Remove Duplicates if Exists
-- 2. Standardize the Data
-- 3. Look for Null values or blank values
-- 4. Remove any unnecessary Columns or Rows

-- If we make some type of mistake while cleaning the data, we want to have the raw data available. 
-- so for that we will create a layoffs_staging database and work on that database.

# Creating a Duplicate Table
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

# Inserting data to Layoffs Staging table
INSERT layoffs_staging
SELECT *
FROM layoffs;


-- 1. Removing Duplicates --

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, 'date') AS row_num
FROM layoffs_staging;


# Creating CTE to identify a duplicate rows
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
			location, 
            industry, 
            total_laid_off, 
            percentage_laid_off,
            `date`, 
            stage, 
            country, 
            funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1 ;

# Checking duplicate values
SELECT * 
FROM layoffs_staging
WHERE company = 'Oyster';


-- Creating a copy of Table(layoffs_staging) with new column 'row_num' --
CREATE TABLE `layoffs_staging2`(
	`company` text,
    `location` text,
    `industry` text,
    `total_laid_off` INT DEFAULT NULL,
    `percentage_laid_off` text,
    `date` text,
    `stage` text,
    `country` text,
    `funds_reised_millions` INT DEFAULT NULL,
    `row_num` INT
) ENGINE = InnoDB DEFAULT CHARSET =utf8mb4 COLLATE = utf8mb4_0900_ai_ci;



SELECT *
FROM layoffs_staging2
WHERE row_num >1
;

# Inserting data to layoffs_staging2 table
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

# Deleting a duplicate data from a table
DELETE
FROM layoffs_staging2
WHERE row_num >1
;

SELECT *
FROM layoffs_staging2;


-- 2. Standardizing Data --
-- Standardizing Data is finding Issues in data and then fixing it --

-------------------------------------------------------------------
# Removing leading or trailing Space form a company column
SELECT company, TRIM(company)
FROM layoffs_staging2;

# UPDATE layoffs_staging2 table with trimmed value
UPDATE layoffs_staging2
SET company = TRIM(company);

---------------------------------------------------------------------
 
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1
;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'CRYPTO%';

# Updating Industry column with Standarized value
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'CRYPTO%';

------------------------------------------------------------------------
# Select distinct country from table
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

# Removing trailing dot to standarized a country name 
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1
;

# Updating a table with a standarized value
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-------------------------------------------------------------------------

# Formatting Date

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;


#Updating date column with formatted date column
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


# Never Apply ALTER TABLE to your raw table. 
# Only do this in your staging table (the table you are working on while cleaning a dataset)

# Changing a Data type of a column 
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


--------------------------------------------------------------------------------------------------------------------------

----------------------------- 3. Working with Null & Blank Values and Populating data ------------------------------------

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';


SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

-- Identifies records in the layoffs_staging2 table where the industry column is NULL  
-- by joining the table to itself (self-join) based on the company and location columns.  
-- It then finds matching rows where the industry is NOT NULL, allowing us to fill in missing industry values  
-- using data from similar records. 
SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


-- Updates the industry column in the layoffs_staging2 table for rows where the industry value is NULL.
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry=t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

---------------------------------------------------------------------------------------------------------------------

----------------------------------- 4.Remove Unnecessary Rows and Columns ------------------------------------------

# Looking for a Null value in total_laid_off & percentage_laid_off
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Deleting a data with Null values from column total_laid_off & percentage_laid_off
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Dropping a row_num column
SELECT *
FROM layoffs_staging2;


ALTER TABLE layoffs_staging2
DROP COLUMN row_num;




