# Crowdfunding-ETL
## Overview: Apply the extract, transform, and load (ETL) process to collect, clean, and store the backers contact information prior to performing analysis. 

### The purpose of this analysis is to create a PostgreSQL database and table schemas by using an entity relationship diagram (ERD), and load the data into the database. Then use SQL to perform data analysis.

## Analysis
- The first part of the analysis is to extract the raw data and add it into a DataFrame before I can transform it. Therefore, I needed to import my data into a DataFrame so that I could read the data and get the backers data information. In the Module code, they wanted me to import the backers_info from the crowdfunding_info sheet. The crowdfunding_info sheet didn't have the backers_info though. However, it was not necessary since I directly imported the information from the backers_info.csv file into a DataFrame already. 

- After I imported the data into a DataFrame, I extract my data by using the Python dictionary method. To do accomplish this, I iterated through the DataFrame to covert each row into a dictionary. Next, I iterated through each dictionary to extract the dictionary values from the keys and added the values for each row to a new list, Image 1.

### Image 1: Python Dictionary Method

![Python Dictionary Method](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/Resources/Python_dict_method.png)

- Once I turned the backers information into a dictionary, I could then turn the information into a new DataFrame. I created the DataFrame from the dict_values I created from Image 1, and then set the columns to backer_id, cf_id, name, and email, Table 1. Then, I exported the DataFrame into a CSV file and saved it as [backers1.csv](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/backers1.csv).

### Table 1: Backers DataFrame

![Backers DataFrame](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/Resources/backers_dataframe.png)

- Now I can transform and clean the data by formatting, splitting, converting data types, and restructuring the data to create a DataFrame that can be loaded into a PostgreSQL database as a CSV file. First I wanted to check the column types to make sure the cf_id was an integer. If it wasn't I wanted to make sure to convert the type, however, the cf_id was already an integer. 

- In addition, I wanted to split the first and last names into their own columns. Therefore, I created two new columns, first_name and last_name, to put the names in, and used the str.split function on the name column. Once I split the names into first and last name columns, I dropped the name column, and re-organized the columns, Table 2. Then I exported the DataFrame as a CSV file, [backers.csv](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/backers.csv), so that I can load the data in my table schema in PostgreSQL.

### Table 2: Cleaned Backers DataFrame

![Cleaned Backers DataFrame](https://github.com/mrma2318/Crowdfunding-ETL/blob/1132643c6754ef9875340911977ac03c1f89eeb5/Resources/cleaned_backers.png)

- Before I could load the data in my table schema though, I need to create my table schema. First, I created an ERD to make sure the columns had the appropriate data type, primary key, and foreign keys. Then I saved the diagram as [crowdfunding_db_relationships.png](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/crowdfunding_db_relationships.png). 

- Now, in PostegreSQL I can create my backers table and load my [backers.csv](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/backers.csv) file. I created my table by using the CREATE TABLE function in SQL and creating my column names and the appropriate schemas.

CREATE TABLE "backers" (
    
    "backer_id" varchar   NOT NULL,
	
    "cf_id" int NOT NULL,
    
    "first_name" varchar(50)   NOT NULL,
    
    "last_name" varchar(50)   NOT NULL,
    
    "email" varchar(100)   NOT NULL,
    
    CONSTRAINT "pk_backers" PRIMARY KEY (
    
        "backer_id"));

- Once the table was created, I could then upload my [backers.csv](https://github.com/mrma2318/Crowdfunding-ETL/blob/ccd874105225b61319ee4ead81bd3fd2e721baf0/backers.csv) file into the backers table. Now, I can run SQL Analysis. 

- First I wanted to write a SQL query that retrievees the number of backer_counts in descending order for each "cf_id" for all the "live" campaigns. Then to confirm the results, I used the backers table to confirm the results from the campaign table. 

- Next, I created a table that has the first name, last name, email, and the goal amount left to reach for all the live projects. As well as another table that contained the email address of each backer, their first name, last name, cf_id, company name, description, end date of the campaign, and the remaining amount of the campaign goal. The code can be found in the [crowdfunding_SQL_Analysis.sql](https://github.com/mrma2318/Crowdfunding-ETL/blob/a4732101e0b7c4920050f20f60d50941bd4ba8bc/crowdfunding_SQL_Analysis.sql). 

## Results
- There are two conclusions you draw from the analysis. First, it's important to understand the ETL process. By studying the data and understanding what you are looking to accomplish, will assist you in the ETL process. If you don't extract, transform, and the clean the data correctly, it can lead to potential errors when you try to upload the data in PostgreSQL tables. 

- The second conclusion you can draw from this analysis is the importance of understanding the relationship between multiple tables. Understanding the relationship between tables will assist you when you need to combine columns from different tables together. You have to know how to the join the tables together to get the information you need. 