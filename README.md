
# BANK LOAN REPORT

![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Thumbnail%20bank%20loan%20report.png)


## Project Overview
The Bank Loan Report is designed to evaluate the performance and health of the bank’s lending activities by analyzing key loan metrics over time. It provides insights into loan volumes, repayment trends, borrower behavior, and overall portfolio quality. By tracking these indicators, the report supports data-driven decision-making, helps identify emerging trends, and enables the bank to refine its lending strategies for better risk management and improved operational efficiency.
## Objective
In order to monitor and assess our bank's lending activities and performance, we need to create a comprehensive Bank Loan Report. This report aims to provide insights into key loan-related metrics and their changes over time. The report will help us make data-driven decisions, track our loan portfolio's health, and identify trends that can inform our lending strategies.
## Dataset
The dataset includes 924415 rows and 24 columns. File is attached in repository.


## Tools

* Excel / CSV – Data pre-processing

* Mysql - Excecuting queries and perform EDA.


## Steps And Workflow
1. Data Cleaning and modeling

2. EDA (Exploratory Data Analysis)

## Key Findings and Insights
1.	The data demonstrates a very healthy and consistent growth pattern for the bank throughout the observed year, with a strong finish in the last quarter (October, November, December).
	  ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Monthly%20Trends%20By%20Issue%20Date.png)

2.	The regional data highlights that the loan activity is highly concentrated in a few key states, primarily CA and FL, while many other states represent small or negligible parts of the overall portfolio. The bank's strategy appears to be heavily focused on these high-volume markets.
	
    ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Regional%20Analysis%20By%20State.png)
  	
3.	The bank's loan portfolio is heavily lean towards the shorter, 36-month term in application count, but the longer, 60-month term loans carry a significantly higher average principal balance.
    ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Loan%20Term%20Analysis.png)
  	
4.	The bank's portfolio is heavily reliant on two stable but distinct segments: the most established employees (10+ years), who are the bank's premium customers, and the newest employees (< 1 to 3 years), who represent a high-volume, potentially younger, segment with smaller average loan needs. The bank's risk model seems comfortable lending to both type of loan needs.
	
      ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Employee%20Length%20Analysis.png)
  	
5.	Calculating the average funded amount (Total Funded Amount / Total Applications) provides insight into the typical size of loans for each purpose:
* Debt Consolidation: $232.46M / $18214 = $12763
* Small Business: $24.12M / $1776  = $13570 (Highest average size among top 3)
* Credit Card: $58.89M / $4998  = $11783
  
--	The Small Business purpose has the highest average loan size among the all categories, suggesting these borrowers require more significant capital than those consolidating debt or paying off credit cards.
  
   ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Loan%20Purpose%20Breakdown.png)
  
6.	Calculating the average funded amount (Total Funded Amount / Total Loan Applications) provides insight into the typical size of loans for each purpose:
* Average RENT Funded Amount : $185,768,475 / $18,439  = $10,075

* Average MORTGAGE Funded Amount: $219,329,150 / $17,198 = $12,753(Highest average size   among top 3)

* Average OWN Funded Amount: $29,597,675 / $2,838 = $10,429

--	Borrowers with a MORTGAGE receive, on average, a loan that is over $2,600 larger than RENT 
and around $2250 larger than OWN FUNDED AMOUNT.

--	The total amount received is consistently higher than the total funded amount for all categories, confirming that all segments are generating interest and positive cash flow for the bank.
    ![image alt](https://github.com/Rohitshinde14/Bank_Loan_Report_MySql/blob/main/Project%20Findings%20Images/Home%20Ownership%20Analysis.png)

## How to Run This Project
* Clone the repository:
git clone https://github.com/Rohitshinde14/Bank_Loan_Report_MySql
* Install the Mysql Workbench 
* Run the sql file:
bank_loan_data.sql


## Recommendations
* Reduce dependency on CA and FL by expanding marketing and credit offers in underrepresented states.

* Offer incentives (reduced rates, flexible EMI) to shift some 36-month applicants to 60-month terms.

* Increase focus on Small Business and Mortgage borrowers since they have the highest average loan sizes.

* Monitoring repayment patterns

* Refining interest rate strategies

* Expanding predictable, interest-generating loan products
## Future Work
* Create Power BI Dashboard for chart based analysis.

## Conclusion
The bank’s loan portfolio demonstrates healthy growth, strong interest income, and a stable customer base across various employment and loan purpose segments. However, the business is geographically concentrated, and there is room for strategic expansion. By leveraging high-value segments (Mortgage, Small Business), optimizing loan terms, and diversifying regional presence, the bank can enhance profitability, reduce risk concentration, and strengthen long-term portfolio stability.
## Contact
Rohit Shinde  
Data Analyst
* Email: shinde.rohit005@gmail.com
* LinkedIn: www.linkedin.com/in/rohitshinde14
* GitHub: https://github.com/Rohitshinde14
