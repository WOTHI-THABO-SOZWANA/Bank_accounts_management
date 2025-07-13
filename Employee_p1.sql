USE bank_accounts_management_systems



SELECT *
FROM employees


#	Checking how many people in each position
SELECT position, Count(*) AS Number_of_people
FROM employees
GROUP BY position

