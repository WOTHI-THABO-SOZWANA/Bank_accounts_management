USE bank_accounts_management_systems

#	Which employees handle the most impactful transactions?
SELECT e.first_name, e.last_name, e.position, COUNT(t.transaction_id) AS transaction_count, SUM(t.amount) AS total_handled
FROM employees e
JOIN transactions t ON e.employee_id = t.employee_id
GROUP BY e.first_name, e.last_name, e.position
ORDER BY total_handled DESC;



#	Which customers contribute the highest account balances?
SELECT c.first_name, c.last_name, c.address, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance DESC;

#	Are there regional concentrations of high-value customers?
SELECT c.address, COUNT(DISTINCT c.customer_id) AS num_customers, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.address
ORDER BY total_balance DESC;


