/* CUSTOMER TABLE */

USE bank_accounts_management_systems

SELECT *
FROM customers

# Most common name
SELECT first_name, COUNT(*) AS name_count
FROM customers
GROUP BY first_name
ORDER BY name_count DESC
LIMIT 5;

# Most common surname
SELECT last_name, COUNT(*) AS name_count
FROM customers
GROUP BY last_name
ORDER BY name_count DESC
LIMIT 5;


#5 Recently born customer
SELECT *
FROM customers
ORDER BY date_of_birth DESC
LIMIT 5;

#Find customers older than 30 
SELECT first_name, last_name, date_of_birth
FROM customers
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 27

#Age brackets
SELECT 
  CASE 
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 25 THEN 'Youth'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 25 AND 44 THEN 'Young Adult'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 45 AND 64 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS group_count
FROM customers
GROUP BY age_group;

# How many people are born on the same month
SELECT MONTH(date_of_birth) AS birth_month, COUNT(*) AS count
FROM customers
GROUP BY birth_month
ORDER BY count DESC;


# Youngest and Oldest customer
SELECT * 
FROM customers
ORDER BY date_of_birth DESC -- Youngest
LIMIT 1;

SELECT * 
FROM customers
ORDER BY date_of_birth ASC -- Oldest
LIMIT 1;


#Finding how many people are from the same place
SELECT 
  TRIM(SUBSTRING_INDEX(address, ',', -1)) AS city,
  COUNT(*) AS customer_count
FROM customers
GROUP BY city
#ORDER BY customer_count DESC
#LIMIT 1;
