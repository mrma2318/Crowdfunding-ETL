# Crowdfunding-ETL
## Overview: Apply the extract, transform, and load (ETL) process to collect, clean, and store the backers contact information prior to performing analysis. 

### The purpose of this analysis is to create a PostgreSQL database and table schemas by using an entity relationship diagram (ERD), and load the data into the database. Then use SQL to perform data analysis.

## Analysis
- The first part of the analysis is to extract the raw data and add it into a DataFrame before I can transform it. Therefore, I needed to import my data into a DataFrame so that I could read the data and get the backers data information. In the Module code, they wanted me to import the backers_info from the crowdfunding_info sheet. The crowdfunding_info sheet didn't have the backers_info though. However, it was not necessary since I directly imported the information from the backers_info.csv file into a DataFrame already. 

- After I imported the data into a DataFrame, I extract my data by using the Python dictionary method. To do accomplish this, I iterated through the DataFrame to covert each row into a dictionary. Next, I iterated through each dictionary to extract the dictionary values from the keys and added the values for each row to a new list, Image 1.

### Image 1: Python Dictionary Method

![Python Dictionary Method]()

- Once I turned the backers information into a dictionary, I could then turn the information into a new DataFrame. I created the DataFrame from the dict_values I created from Image 1, and then set the columns to backer_id, cf_id, name, and email, Table 1. Then, I exported the DataFrame into a CSV file and saved it as [backers1.csv]().

### Table 1: Backers DataFrame

![Backers DataFrame]()



## Results