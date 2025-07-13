USE bank_accounts_management_systems

SELECT *
FROM accounts

#	Which customer has the highest and/or lowest balance and which account type they have
/*
SELECT MAX(balance) AS Highest_balance
FROM accounts

SELECT MAX(balance) AS highest_balance, COUNT(*) AS number_of_accounts 
FROM accounts
WHERE balance = (SELECT MAX(balance) FROM accounts)

SELECT customer_id, balance, account_type
FROM accounts
ORDER BY balance DESC
LIMIT 1
*/

SELECT customer_id, balance, account_type
FROM accounts
WHERE balance = (SELECT MAX(balance) FROM accounts)

SELECT customer_id, balance, account_type
FROM accounts
WHERE balance = (SELECT MIN(balance) FROM accounts)

#	Whats the balance on each account type
SELECT account_type, SUM(balance) AS Total_balance
FROM accounts
GROUP BY account_type

