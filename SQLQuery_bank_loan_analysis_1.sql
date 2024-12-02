SELECT * FROM bank_loan_data

SELECT COUNT(id) AS Total_Number_Application FROM bank_loan_data

--Total Number of Loan Application for the month of December
SELECT COUNT(id) AS MTD_Total_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 12 -- MTD = 4314

--Total Number of Loan Application for the month of November
SELECT COUNT(id) AS PMTD_Total_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 11 -- PMTD = 4035
--Now, we can calculate the change of total number of applications from November to December
-- (MTD-PMTD)/PMTD=(4314-4035)/4035 = 7.97

--Total Loan Amount
SELECT SUM(loan_amount) AS Total_Fund FROM bank_loan_data 

--Total Fund in Month = December 2021
SELECT SUM(loan_amount) AS Total_Fund_December FROM bank_loan_data 
WHERE MONTH(issue_date) = 12

--Total Fund in Month = November 2021
SELECT SUM(loan_amount) AS Total_Fund_November FROM bank_loan_data 
WHERE MONTH(issue_date) = 11

--Total Fund Per Month
SELECT MONTH(issue_date) AS Name_Of_Month, SUM(loan_amount) Total_Fund_Per_Month FROM bank_loan_data
GROUP BY MONTH(issue_date)
ORDER BY Name_Of_Month

--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data 

SELECT SUM(total_payment) AS Total_Amount_Received_December FROM bank_loan_data 
WHERE MONTH(issue_date) = 12

SELECT SUM(total_payment) AS Total_Amount_Received_November FROM bank_loan_data 
WHERE MONTH(issue_date) = 11

-- Average Interest Rate
SELECT * FROM bank_loan_data

SELECT ROUND(AVG(int_rate)*100, 2) AS Average_Interest_Rate_December FROM bank_loan_data
WHERE MONTH(issue_date) = 12

SELECT ROUND(AVG(int_rate)*100, 2) AS Average_Interest_Rate_December FROM bank_loan_data
WHERE MONTH(issue_date) = 11


SELECT MONTH(issue_date) AS Name_Of_Month, ROUND(AVG(int_rate)*100, 2) AS Average_Interest_Rate_Per_Month FROM bank_loan_data
GROUP BY MONTH(issue_date)
ORDER BY Name_Of_Month

-- Average Debt-to-Income Ratio (DTI)
SELECT ROUND(AVG(dti), 2) AS Average_DTI FROM bank_loan_data

SELECT ROUND(AVG(dti), 2) AS Average_DTI_December FROM bank_loan_data
WHERE MONTH(issue_date) = 12

SELECT ROUND(AVG(dti), 2) AS Average_DTI_November FROM bank_loan_data
WHERE MONTH(issue_date) = 11

SELECT MONTH(issue_date) AS Name_Of_Month, 
ROUND(AVG(dti), 2) AS Average_Debt_to_Income 
FROM bank_loan_data
GROUP BY MONTH(issue_date)
ORDER BY Name_Of_Month

SELECT * FROM bank_loan_data

SELECT loan_status FROM bank_loan_data

SELECT DISTINCT loan_status FROM bank_loan_data

--Percentages of Good Loaners
SELECT 
	COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100
	/
	COUNT(id) 
AS Good_Loans_Percentage 
FROM bank_loan_data


--Total Number of Good Loan Applications
SELECT COUNT(id) AS Total_Number_Of_Good_Loaners 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Funded Amount of Good Loan Applications
SELECT SUM(loan_amount) AS Total_Fund_Of_Good_Loaners
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Received Amount of Good Loan Applications
SELECT SUM(total_payment) AS Total_Amount_Received_Frome_Good_Loaners
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Percentages of Bad Loaners
SELECT 
	COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100
	/
	COUNT(id) 
AS Bad_Loans_Percentage 
FROM bank_loan_data

--Total Number of Bad Loan Applications
SELECT COUNT(id) AS Total_Number_Of_Bad_Loaners 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Funded Amount of Bad Loan Applications
SELECT SUM(loan_amount) AS Total_Fund_Of_Bad_Loaners
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Received Amount of Bad Loan Applications
SELECT SUM(total_payment) AS Total_Amount_Received_Frome_Bad_Loaners
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Loan Status Grid
SELECT * FROM bank_loan_data

--How much money has been loan and paid back by customers in issu_date = 12 (December) 
SELECT loan_status,
	COUNT(id) AS Number_Loans,
	SUM(loan_amount) AS Total_Amount_Loan,
	SUM(total_payment) AS Loan_Paid_back,
	ROUND(AVG(int_rate *100), 2) AS Average_Interest_Rate,
	ROUND(AVG(dti * 100), 2) AS Average_Debth_to_Income_Ratio
FROM bank_loan_data
GROUP BY loan_status

--How much money has been loan and paid back by customers in issu_date = 12 (December)
SELECT loan_status,
SUM(loan_amount) AS December_Total_Amount_Loan,
SUM(total_payment) AS December_Loan_Paid_back
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

