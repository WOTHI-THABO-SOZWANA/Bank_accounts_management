USE bank_accounts_management_systems

SELECT *
FROM reports

# Finding reports with the name SALES or ANALYSIS
SELECT *
FROM reports
WHERE UPPER(report_description) LIKE '%SALES%'
	OR UPPER(report_description) LIKE '%ANALYSIS%'
    
#	Finding out how many reports were made in each month
/*
SELECT COUNT(*)
FROM reports
WHERE DATE_FORMAT(report_date, '%Y %M') = '2023-02'
*/

SELECT 'January 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-01-01' AND  '2023-01-31'

SELECT 'February 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-02-01' AND  '2023-02-28'

SELECT 'March 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-03-01' AND  '2023-03-31'

SELECT 'April 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-04-01' AND  '2023-04-28'

SELECT 'May 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-05-01' AND  '2023-05-30'

SELECT 'June 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-06-01' AND  '2023-06-30'

SELECT 'July 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-07-01' AND  '2023-07-31'

SELECT 'August 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-08-01' AND  '2023-08-31'

SELECT 'September 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-09-01' AND  '2023-09-30'

SELECT 'October 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-10-01' AND  '2023-10-31'

SELECT 'November 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-11-01' AND  '2023-11-30'

SELECT 'December 2023' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-12-01' AND  '2023-12-31'

SELECT 'Year 2024' AS month_name, COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2024-01-01' AND  '2024-12-31'

#	In a short code
SELECT 
  DATE_FORMAT(report_date, '%M %Y') AS month_name,
  COUNT(*) AS total_reports
FROM reports
WHERE report_date BETWEEN '2023-01-01' AND '2024-12-31'
GROUP BY month_name
ORDER BY STR_TO_DATE(month_name, '%M %Y');
