SELECT * FROM bank_loan_data

-- Loan_amount and paid back in different months according to loan_status 
SELECT 
MONTH(issue_date) AS Month_Name, 
DATENAME(MONTH, issue_date) AS Issue_Date,
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

-- Analyzing Regions in loan 
SELECT 
address_state AS State_of_Region,  
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data 
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC


--Loan Term Analysis
SELECT 
term AS term,  
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data 
GROUP BY term
ORDER BY term DESC

--Employee length analysis
SELECT emp_length AS Employment_Length,
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data 
GROUP BY emp_length
ORDER BY COUNT(id) DESC

--Loan_Purpose Analysis
SELECT purpose AS Loan_Purpose,
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data 
GROUP BY purpose
ORDER BY COUNT(id) DESC


-- Home Ownership Analysis
SELECT home_ownership AS Home_Ownership,
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

--Adding Filters like Grade:
SELECT home_ownership AS Home_Ownership,
COUNT(id) AS Number_Loans,
SUM(loan_amount) AS Total_Amount_Loan,
SUM(total_payment) AS Loan_Paid_back
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC