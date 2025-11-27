SELECT * FROM bank_loan_data;

alter table bank_loan_data
add column con_issue_date date

-- converting date values to valid date format
update bank_loan_data 
set con_issue_date = case
	when issue_date like '__/__/____' then str_to_date(issue_date, '%d/%m/%Y') -- dd/mm/yyyy
	when issue_date like '__-__-____' then str_to_date(issue_date, '%d-%m-%Y') -- dd-mm-yyyy
	when issue_date like '____-__-__' then str_to_date(issue_date, '%Y-%m-%d') -- yyyy-mm-dd
	else null
end;

alter table bank_loan_data
drop column issue_date
select * from bank_loan_data

alter table bank_loan_data
change column con_issue_date issue_date date
select * from bank_loan_data

-- repeating above process for last_credit_pull_date
alter table bank_loan_data
add column con_last_credit_pull_date date

-- converting date values to valid date format
update bank_loan_data 
set con_last_credit_pull_date = case
	when last_credit_pull_date like '__/__/____' then str_to_date(last_credit_pull_date, '%d/%m/%Y') -- dd/mm/yyyy
	when last_credit_pull_date like '__-__-____' then str_to_date(last_credit_pull_date, '%d-%m-%Y') -- dd-mm-yyyy
	when last_credit_pull_date like '____-__-__' then str_to_date(last_credit_pull_date, '%Y-%m-%d') -- yyyy-mm-dd
	else null
end;

alter table bank_loan_data
drop column last_credit_pull_date

alter table bank_loan_data
change column con_last_credit_pull_date last_credit_pull_date date

select * from bank_loan_data

-- repeating above process for last_payment_date
alter table bank_loan_data
add column con_last_payment_date date

-- converting date values to valid date format
update bank_loan_data 
set con_last_payment_date = case
	when last_payment_date like '__/__/____' then str_to_date(last_payment_date, '%d/%m/%Y') -- dd/mm/yyyy
	when last_payment_date like '__-__-____' then str_to_date(last_payment_date, '%d-%m-%Y') -- dd-mm-yyyy
	when last_payment_date like '____-__-__' then str_to_date(last_payment_date, '%Y-%m-%d') -- yyyy-mm-dd
	else null
end;

alter table bank_loan_data
drop column last_payment_date

alter table bank_loan_data
change column con_last_payment_date last_payment_date date

select * from bank_loan_data 

-- repeating above process for next_payment_date
alter table bank_loan_data
add column con_next_payment_date date

-- converting date values to valid date format
update bank_loan_data 
set con_next_payment_date = case
	when next_payment_date like '__/__/____' then str_to_date(next_payment_date, '%d/%m/%Y') -- dd/mm/yyyy
	when next_payment_date like '__-__-____' then str_to_date(next_payment_date, '%d-%m-%Y') -- dd-mm-yyyy
	when next_payment_date like '____-__-__' then str_to_date(next_payment_date, '%Y-%m-%d') -- yyyy-mm-dd
	else null
end;

alter table bank_loan_data
drop column next_payment_date

alter table bank_loan_data
change column con_next_payment_date next_payment_date date

select * from bank_loan_data

-- total loan applications
SELECT 
    COUNT(id) AS total_loan_applications
FROM
    bank_loan_data

-- MTD total loan applications
    SELECT 
    COUNT(id) AS MTD_total_loan_applications
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021
        
-- Previous MTD total loan applications
    SELECT 
    COUNT(id) AS PMTD_total_loan_applications
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021

-- total funded amount
SELECT 
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
    
-- MTD total funded amount
SELECT 
    SUM(loan_amount) AS MTD_total_funded_amount
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021

-- Previous MTD total funded amount
SELECT 
    SUM(loan_amount) AS PMTD_total_funded_amount
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021
 
-- total amount received
 SELECT 
    SUM(total_payment) AS total_amount_recived
FROM
    bank_loan_data

-- MTD total amount received
 SELECT 
    SUM(total_payment) AS MTD_total_amount_recived
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021 

-- Previous MTD total amount received
 SELECT 
    SUM(total_payment) AS PMTD_total_amount_recived
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021

-- avg interest rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM
    bank_loan_data 
    
-- MTD avg interest rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS MTD_avg_interest_rate
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021 

-- PMTD avg interest rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS PMTD_avg_interest_rate
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021
        
-- avg debt to income ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS avg_dti
FROM
    bank_loan_data
    
-- MTD avg debt to income ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS MTD_avg_dti
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021
        
-- PMTD avg debt to income ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS PMTD_avg_dti
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021
        
-- good loan percentage
SELECT 
    ROUND((COUNT(CASE
                WHEN
                    loan_status = 'Fully Paid'
                        OR loan_status = 'Current'
                THEN
                    id
            END) * 100) / COUNT(id),
            2) AS good_loan_percentage
FROM
    bank_loan_data
    
-- good loan applications
SELECT 
    COUNT(id) as good_loan_applications
FROM
    bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current'
        
-- good loan funded amount
SELECT 
    sum(loan_amount) as good_loan_funded_amount
FROM
    bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current'
        
-- good loan received amount
SELECT 
    sum(total_payment) as good_loan_received_amount
FROM
    bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current'
        
-- bad loan percentage
SELECT 
    ROUND(COUNT(CASE
                WHEN loan_status = 'Charged off' THEN id
            END) * 100 / COUNT(id),
            2) AS bad_loan_percentage
FROM
    bank_loan_data
    
-- bad loan applications
SELECT 
    COUNT(id) AS bad_loan_applications
FROM
    bank_loan_data
WHERE
    loan_status = 'Charged off'
    
-- bad loan funded amount
SELECT 
    sum(loan_amount) AS bad_loan_funded_amount
FROM
    bank_loan_data
WHERE
    loan_status = 'Charged off'
    
-- bad loan received amount
SELECT 
    sum(total_payment) AS bad_loan_received_amount
FROM
    bank_loan_data
WHERE
    loan_status = 'Charged off'
    
-- loan status
SELECT 
    loan_status,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount,
    AVG(int_rate * 100) AS interest_rate,
    AVG(dti * 100) AS dti
FROM
    bank_loan_data
GROUP BY loan_status

-- MTD total funded and MTD total received amount loan status
SELECT 
    loan_status,
    SUM(total_payment) AS MTD_total_amount_received,
    SUM(loan_amount) AS MTD_total_funded_amount
FROM
    bank_loan_data
WHERE
    MONTH(issue_date) = 12
GROUP BY loan_status

-- month wise
SELECT 
    MONTH(issue_date) AS month_number,
    DATE_FORMAT(issue_date, '%M') AS month_name,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY MONTH(issue_date) , DATE_FORMAT(issue_date, '%M')
ORDER BY MONTH(issue_date)

-- state wise 
SELECT 
    address_state as state,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY address_state
ORDER BY address_state

-- term wise
SELECT 
    term,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY term
ORDER BY term

-- employee length wise
SELECT 
    emp_length as employee_length,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-- purpose wise
SELECT 
    purpose,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

-- home ownership wise
SELECT 
    home_ownership,
    COUNT(id) AS total_loan_applications,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount
FROM
    bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC



