USE bank_accounts_management_systems

SELECT *
FROM transactions

#	Check how many deposits were made
SELECT transaction_type, COUNT(*) AS tot_transactions
FROM transactions
GROUP BY transaction_type

#	Checking the total amount made from each transaction type
SELECT transaction_type, SUM(amount) AS sum_of_each_trans
FROM transactions
GROUP BY transaction_type

#	Checking which transactions has the highest amount, and on which date
SELECT transaction_type, amount, transaction_date
FROM transactions
WHERE amount = (SELECT MAX(amount) FROM transactions)

#	The oldest transaction
SELECT *
FROM transactions
WHERE transaction_date = (SELECT MIN(transaction_date) FROM transactions)

#	The youngest transaction
SELECT *
FROM transactions
WHERE transaction_date = (SELECT MAX(transaction_date) FROM transactions)



#	Checking the youngest and oldest transaction in each transaction_type

SELECT t.transaction_type, t.transaction_date, t.amount
FROM transactions t
WHERE t.transaction_date = (
    SELECT MIN(t2.transaction_date)
    FROM transactions t2
    WHERE t2.transaction_type = t.transaction_type
);


SELECT t.transaction_type, t.transaction_date, t.amount
FROM transactions t
JOIN (
    SELECT transaction_type, MAX(transaction_date) AS max_date
    FROM transactions
    GROUP BY transaction_type
) latest ON t.transaction_type = latest.transaction_type
AND t.transaction_date = latest.max_date;
