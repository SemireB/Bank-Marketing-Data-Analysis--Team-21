select * from bank;

/* Team Project 1 for Team#21 */ 

/* Business Case: Analyzing Factors Influencing Term Deposit Acquisition */

/*
Executive Summary
This business case explores the relationship between customer demographics, financial standing, and campaign strategy on the likelihood of acquiring a term deposit. By understanding these factors, our bank can refine marketing strategies, improve customer targeting, and ultimately increase term deposit sales.

Objectives
a. Identify key customer demographics that influence term deposit acquisition. 
b. Assess the impact of financial standing on customer decisions. 
c. Evaluate the effectiveness of current campaign strategies. 
d. Develop actionable recommendations to enhance marketing efforts.

Background

Term deposits are a cornerstone of our savings products, providing a secure investment option for customers. 
However, recent trends indicate a need to better understand the factors influencing customer decisions in order to optimize our marketing strategies and increase conversions.

*/

/*
1. Basic Segmentation by Customer Demographics and Balance
We can start by segmenting customers based on key demographic attributes and their account balance. 
Customers with higher balances or certain jobs might be more likely to subscribe to a term deposit.

Query: Segment by age, balance, and job type

This query will give us insights into which demographic and balance groups have higher subscription rates, identifying high-opportunity segments.

*/

SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Older'
    END AS age_group,
    CASE 
        WHEN balance < 1000 THEN 'Low Balance'
        WHEN balance BETWEEN 1000 AND 5000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_group,
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) AS total_subscribed,
    ROUND(SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS subscription_rate
FROM 
    bank
GROUP BY 
    age_group, balance_group, job
ORDER BY 
    subscription_rate DESC;
	
/*
Segmenting Based on Previous Marketing Campaign Interactions
Customers who have been previously contacted and their behavior (e.g., whether they subscribed or not) can be good indicators of future success. You can use features like previous, campaign, or contact to create segments based on previous interactions.

Query: Segment by previous contacts and outcome of previous campaign

This will help identify whether customers with prior contact are more likely to subscribe and the impact of previous marketing efforts.

*/

SELECT 
    CASE 
        WHEN previous = 0 THEN 'No Previous Contact'
        WHEN previous BETWEEN 1 AND 3 THEN '1-3 Previous Contacts'
        ELSE 'More than 3 Contacts'
    END AS previous_contact_group,
    CASE 
        WHEN pdays = -1 THEN 'Never Contacted in Previous Campaign'
        ELSE 'Contacted Before'
    END AS contacted_before_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) AS total_subscribed,
    ROUND(SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS subscription_rate
FROM 
    bank
GROUP BY 
    previous_contact_group, contacted_before_group
ORDER BY 
    subscription_rate DESC;
	
	
/*
High-Risk Segmentation by Loan and Credit Status
We can identify high-risk segments by looking at customers with loans, defaults, or low balances, as they might be less likely to subscribe to a term deposit.

Query: Segment by housing loan, personal loan, and credit default


*/

SELECT 
    CASE 
        WHEN housing = 'yes' THEN 'Has Housing Loan'
        ELSE 'No Housing Loan'
    END AS housing_loan_group,
    CASE 
        WHEN loan = 'yes' THEN 'Has Personal Loan'
        ELSE 'No Personal Loan'
    END AS personal_loan_group,
    CASE 
        WHEN "default" = 'yes' THEN 'Has Credit Default'
        ELSE 'No Credit Default'
    END AS credit_default_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) AS total_subscribed,
    ROUND(SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS subscription_rate
FROM 
    bank
GROUP BY 
    housing_loan_group, personal_loan_group, credit_default_group
ORDER BY 
    subscription_rate DESC;

/*
Segmentation by Month of Contact
Analyzing the impact of the month when the customer was contacted can help identify high-opportunity periods for campaigns.

Query: Segment by month of contact

*/

SELECT 
    month,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) AS total_subscribed,
    ROUND(SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS subscription_rate
FROM 
    bank
GROUP BY 
    month
ORDER BY 
    subscription_rate DESC;
	
/*
Advanced Segmentation by Combining Key Attributes
For a more complex segmentation, you can combine multiple attributes such as age, job, balance, and previous contacts.

Query: Advanced segmentation combining multiple attributes

*/

SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Older'
    END AS age_group,
    job,
    CASE 
        WHEN balance < 1000 THEN 'Low Balance'
        WHEN balance BETWEEN 1000 AND 5000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_group,
    CASE 
        WHEN previous = 0 THEN 'No Previous Contact'
        ELSE 'Contacted Before'
    END AS previous_contact_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) AS total_subscribed,
    ROUND(SUM(CASE WHEN outcome = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS subscription_rate
FROM 
    bank
GROUP BY 
    age_group, job, balance_group, previous_contact_group
ORDER BY 
    subscription_rate DESC;

/*
Conclusion:
By running these SQL queries, you can identify high-risk or high-opportunity customer segments for a term deposit marketing campaign based on key customer attributes like age, job, balance, contact history, and loan status. 
These insights can guide targeted marketing strategies to improve campaign effectiveness.


*/

