# Team 21 Project

---

### Business Case: 
Analyzing Factors Influencing Term Deposit Acquisition

### Executive Summary:
This business case explores the relationship between customer demographics, financial standing, and campaign strategy on the likelihood of acquiring a term deposit. By understanding these factors, our bank can refine marketing strategies, improve customer targeting, and ultimately increase term deposit sales.

### Dataset Information:
The data is related with direct marketing campaigns (phone calls) of a Portuguese banking institution. The classification goal is to predict if the client will subscribe a term deposit (variable y).
Linke to dataset- https://archive.ics.uci.edu/dataset/222/bank+marketing

### Research Question: 
How do customer demographics, financial standing, and marketing campaign strategies interact to influence the likelihood of acquiring a term deposit among customers of a banking institution?
This question aims to explore the relationships between these variables and identify the key factors that drive customer decisions regarding term deposits.


### Objectives:
1. Identify key customer demographics that influence term deposit acquisition.
2. Assess the impact of financial standing on customer decisions. 
3. Evaluate the effectiveness of current campaign strategies. 
4. Develop actionable recommendations to enhance marketing efforts.

### Background:
Term deposits are a cornerstone of our savings products, providing a secure investment option for customers. However, recent trends indicate a need to better understand the factors influencing customer decisions in order to optimize our marketing strategies and increase conversions.


### Project Process for Customer Term Deposit Analysis

#### **1. Project Initiation**  
- **Task 1.1:** Conduct a kick-off meeting to introduce team members and outline project goals.  
- **Task 1.2:** Define specific objectives and establish success metrics for the analysis.  
- **Task 1.3:** Assign roles and responsibilities to team members.  

#### **2. Data Collection**  
- **Task 2.1:** Identify relevant data sources, including internal databases, public datasets, and CRM systems.  
- **Task 2.2:** Determine necessary variables related to demographics, financial standing, and campaign strategies.  
- **Task 2.3:** Collect datasets, ensuring they include:  
  - **Customer Demographics:** Age, income, location.  
  - **Financial Standing:** Credit scores, existing accounts, debt levels.  
  - **Campaign Data:** Channels, messaging.  

#### **3. Data Preparation**  
- **Task 3.1:** Clean the dataset by removing duplicates, correcting inaccuracies, and handling missing values.  
- **Task 3.2:** Transform the data into a suitable format for analysis (e.g., encoding categorical variables, normalizing numerical data).  
- **Task 3.3:** Document the data preparation process for transparency and reproducibility.  

#### **4. Exploratory Data Analysis (EDA)**  
- **Task 4.1:** Conduct descriptive statistics to summarize data distributions and key characteristics.  
- **Task 4.2:** Create visualizations such as histograms, box plots, and scatter plots to identify patterns and correlations among variables.  
- **Task 4.3:** Document findings from EDA, highlighting trends or anomalies.   

#### **5. Data Analysis**  
- **Task 5.1:** Select appropriate analytical methods (e.g., regression analysis, logistic regression, correlation analysis).  
- **Task 5.2:** Perform the analysis to test hypotheses, focusing on the interaction between demographics, financial standing, and campaign strategies.  
- **Task 5.3:** Interpret the results in the context of the business case.  

#### **6. Results Interpretation**  
- **Task 6.1:** Analyze and summarize key findings related to customer decisions on term deposits.  
- **Task 6.2:** Identify significant factors influencing the likelihood of acquiring term deposits.  


### Outcomes

#### Summary of data preparation

To handle missing values in the dataset, the following approach was implemented. First, categorical columns were checked for the presence of 'unknown' or placeholder values by iterating through each column and displaying its unique values. Next, for columns containing 'unknown' values, these were replaced with the mode (most frequent value) of the respective column. This ensured a logical imputation of missing values based on the existing data distribution. Finally, the replacement was verified by rechecking the count of 'unknown' in each column to confirm that the imputation was successfully applied. This process effectively handled missing values while maintaining the integrity of the dataset.


#### Summary of data analysis

##### Categorical Variables
To gain a deeper understanding of customer demographics and behaviors, the frequency counts and proportions for various categorical features in the dataset were calculated. These included job, marital status, education, default status, housing loan, personal loan, and more. This step helped in identifying the distribution of categories within each feature and understanding the potential relationship between these categories and the likelihood of acquiring a term deposit.
To make the categorical data more insightful, various visualizations were provided that highlighted the proportions of customers in each category. These visualizations included: Bar plots showing the proportions of each category for features like job, marital status, and education. This allowed for easy comparison between categories. Stacked bar plots for each categorical feature in relation to the outcome variable (outcome), which showed how different customer segments are distributed across term deposit subscribers versus non-subscribers. Pie charts for each categorical feature, which provided an alternative, intuitive visualization for proportions.

From the frequency counts and visualizations, the following trends were observed:

* Marital Status: Married customers had a higher likelihood of subscribing to term deposits compared to single customers.
Job Type: Certain job categories, like retired and technician, showed a higher likelihood of subscribing to term deposits, potentially due to their stable income or investment preferences.
* Education: Customers with a higher education level tended to show a stronger preference for secure investment options like term deposits.

##### Numerical Variables
The dataset represents client interactions during direct marketing campaigns by a Portuguese bank.
* The average age of clients is 41 years,average account balance is approximately €1423.
* Most contacts occurred on the 15th day of the month on average.
* Calls lasted an average of 264 seconds.
* Clients were contacted about 2.8 times per campaign, with an average of 40 days since a prior campaign.
* Previous contacts averaged about 0.5 times per client.

The median values in this dataset provide a clearer view of typical client characteristics during marketing campaigns:
* Age: 39 years, indicating middle-aged clientele.
* Balance: €444, reflecting a relatively modest financial status.
* Day: 16th, showing most interactions occurred mid-month.
* Duration: 185 seconds, suggesting brief calls.
* Campaign: 2, meaning clients were typically contacted twice per campaign.
* Pdays: -1, showing many clients were not previously contacted.
* Previous: 0, indicating no prior interactions for the majority.

To determine statistical metrics (e.g., standard deviation, range, and IQR) for numerical variables in a dataset the process began with loading the dataset and selecting key numerical columns, including variables like age, balance, and duration, for analysis. Descriptive statistics were then calculated for each variable, providing insights into their central tendencies and variability. To complement this, boxplots were created to visualize the distribution of each variable and highlight potential outliers.

The findings revealed significant variability in variables such as balance and pdays, which could influence modeling decisions in predictive analytics. Subscribers ("yes") tend to have slightly higher median ages and account balances compared to non-subscribers, with fewer outliers in both older ages and very high balances, suggesting a modest positive association with these variables. Campaign efforts show that fewer contacts are associated with a higher likelihood of subscription, while non-subscribers ("no") tend to have longer tails with more frequent high-contact outliers. Similarly, shorter durations since the last contact (lower pdays) and fewer prior contacts are more closely linked to positive outcomes, while non-subscribers exhibit a wider range and higher values for these variables.


##### Linear Regression Experiment

The dataset consisted of 45,211 rows and 17 features, encompassing demographic, economic, and campaign-related data. The analysis began with an initial inspection to identify key features, such as customers with the highest balances. Scatter plots and regression lines were employed to visualize relationships between numerical features and the target variable, balance, providing insights into potential correlations. Subsequently, a linear regression model was developed to predict balance, utilizing a 75-25 train-test split for validation. The model's performance, evaluated using the Root Mean Squared Percentage Error (RMSPE), yielded a value of 3.19. While this indicates some level of predictive ability, it also highlights opportunities for further model optimization and refinement.


### Key Insights

##### Most influential factors affecting subscriptions (excluding duration)

![important_features_graph.png](https://github.com/SemireB/Bank-Marketing-Data-Analysis-Team-21/blob/Contribution-Semire/Images/important_features_graph.png)

This bar plot illustrates the feature importance for predicting whether a client will subscribe to a term deposit ("yes"). It shows the relative contribution of each feature to the predictive model.

###### *Features of importance for our analysis:
* Balance and Age are important features, suggesting that clients' financial standing and age also play a significant role.
* Features like day, campaign, and poutcome_success (outcome of a previous marketing campaign) also contribute meaningfully.
    
###### *Lesser Impact Features: 
* Variables such as month, specific job categories, and housing or loan status have lower importance, indicating they may be less critical for predicting subscription likelihood.

###### Note: Duration variable was omitted due to the highimpact it has on the ouput target. As stated in the data source file - e.g., if duration=0 then y='no'. Yet, the duration is not known before a call is performed. Also, after the end of the call y is obviously known. Thus, this input should only be included for benchmark purposes and should be discarded if the intention is to have a realistic predictive model (source- https://archive.ics.uci.edu/dataset/222/bank+marketing).



##### Relationship between age and subscription

![age_vs_subscription_graph.png](https://github.com/SemireB/Bank-Marketing-Data-Analysis-Team-21/blob/Contribution-Semire/Images/age_vs_subscription_graph.png)

###### Key Takeaways:
* Age Distribution and Median: Clients who subscribed to the term deposit ("yes") have a slightly higher median age compared to those who did not ("no"). Both groups are concentrated in the middle-age range (30-50 years old).

* Outliers: The "no" group has a larger number of outliers in older age ranges (above 60), suggesting that older clients are less likely to subscribe.

* Spread and Similarity: The overall age range and spread are fairly similar for both groups, indicating that age alone is not a strong predictor, though subtle differences exist.



##### Relationship between balance and subscription

![balance_vs_subscription_graph.png](https://github.com/SemireB/Bank-Marketing-Data-Analysis-Team-21/blob/main/Images/Balance_vs_subscription_graph.png)


###### Key Takeaways:
* Balance Differences: There is a clear balance difference between those who subscribed and those who didn’t, This might mean that individuals with more money in their accounts feel more comfortable subscribing. 

* Error: The black lines on top of each bar are error bars, showing how much variation each group has in their balance. There’s a bit more variability in the balances of those who subscribed compared to those who did not, which we can see from the slightly larger error bars.

* Potential Insight: People with higher balances might be more financially comfortable and, therefore more inclined to subscribe. This is something to consider when establishing targets for future marketing efforts.



##### Relationship between day and subscription

![day_vs_subscription_graph.png](https://github.com/SemireB/Bank-Marketing-Data-Analysis-Team-21/blob/Contribution-Semire/Images/day_vs_subscription_graph.png)


###### Key Takeaways:
* Better Ratio on Specific Days: Days like the 5th, 6th, and 20th have slightly higher orange bars than others. This means that the ratio of people who subscribe on these days is better than other days. Even though the absolute number is not very high, these days stand out as having somewhat more favourable outcomes for subscriptions.

* Overall Trend: Despite some days presenting better outcomes, the overall pattern shows that the subscription rate remains very low compared to the total contacts made. The orange bars do not match the blue bars proportionately on any day, highlighting a consistently low conversion rate.


### Recommendations

#### Customer Demographics:

a. Target age groups: Focus marketing efforts on middle-aged customers who show a higher likelihood of term deposit subscriptions.

b. Refine Outreach for Older Clients: Develop tailored messaging for older clients (above 60) to address potential barriers or concerns, as they are underrepresented among subscribers despite being contacted.

c. Segment Strategies by Age: Conduct additional analyses to explore preferences and behaviors by age segment, which can help refine campaign strategies to improve effectiveness.

#### Financial Standing:

a. Balance: It might be helpful to segment the campaign audience based on their account balance and focus marketing efforts on those with higher balances since they seem more likely to subscribe.

Balance cont'd: Analyze whether there is a specific balance threshold above which people are significantly more likely to subscribe. This could help fine-tune future marketing campaigns.

#### Campaign Effectiveness:

a. Optimal contact frequency: Avoid excessive follow-ups as diminishing returns are observed after 2-3 contacts. Focus on delivering impactful communication within fewer attempts.

b. Leverage recent contacts: Customers contacted more recently (pdays) show better response rates. Prioritize follow-ups with recently contacted customers.

#### Historical Campaign Data:

a. Previous campaign success: Customers with a successful outcome in prior campaigns are more likely to subscribe again. Use this information to re-target such customers.

b. Negative outcomes: Analyze why customers with past negative outcomes are not subscribing and adjust strategies accordingly (e.g., address their concerns in future campaigns).






### Video Reflection Links

**Semire Bamikole-** https://www.loom.com/share/269e627f4c2f4d6399dcdbdf1136db2e?sid=7de74949-754b-4824-90bb-b4827c6a7a93

**Brandon B-**

**Laura Barbosa-**

**Yan-**

**Tina Lin-**


## Division of Responsibilities

* Semire Bamikole:
  * Organize and structure business case and team repo folders
  * Determine mean and medians for numerical varibales + visual summary of the output
* Laura Barbosa:
  * Clean the dataset by removing duplicates, correcting inaccuracies, and handling missing values
  * Transform the data into a suitable format for analysis (e.g., encoding categorical variables, normalizing numerical data)
* Yan:
  * Determine standard deviation, range, IQR for numerical varibales + visual summary of the output
* Brandon B:
  * Determine frequency counts and proportions for categorical varibales + visual summary of the output
* Tina Lin:
  * Gather and document requirements
  * Write, test and maintain code
  * Update documentation for technical solutions
 
* Everyone: Analyzing/summarizing findings and compiling final results and readme file
 
## Learning Outcomes

### Part 1 Learning Outcomes
By the end of **Part 1**, participants will be able to:
* Work through common problems or challenges a team encounters when collaborating using Git and GitHub, including merge conflicts.
* Understand your business case and dataset.
* Perform investigative analysis on your dataset with contributions from multiple team members.

### Part 2 Learning Outcomes
By the end of **Part 2**, participants will be able to:
* Create a data visualization or a machine learning model as a team.
* Clearly document and present the results of their analysis.
* Reflect on their learning and collaboration process through a recorded video.



