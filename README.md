Inventory Management and Online Order Tracking
Overview:
This repository contains a database management system using the Olist dataset, which includes data on customer orders, products, reviews, and seller etc from an e-commerce platform in Brazil. The purpose of this system is to enable efficient data storage, manipulation, and querying for data analysis and business intelligence.


Main Data Source:
The Olist dataset was obtained from Kaggle (https://www.kaggle.com/olistbr/brazilian-ecommerce ), which provides a comprehensive set of CSV files containing transactional data from January 2017 to August 2018. The files were downloaded and cleaned.


Database Schema:
The database schema was designed to reflect the relational structure of the data and optimize for query performance. We used query tools on pgAdmin for creating database schemas. It consists of the following tables:
Customers
Orders
Order_items
Products
Sellers
Order_reviews
Geolocation 
Order_payments 
Product_seller 


The extra columns and data were generated and added to the main dataset which was then imported into a PostgreSQL database. To generate the data for the added columns an online data generator was used.
https://extendsclass.com/csv-generator.html


Installation:
To install the following software, the following links have been used:
        •        PostgreSQL (https://www.postgresql.org/)
        •        pgAdmin (https://www.pgadmin.org/)


Tables are created in the postgreSQL and the data from the csv files is imported to the postgreSQL.
SQL scripts are executed in the "sql" folder to create the tables, insert the data, and create necessary indexes, triggers and functions.
GUI is created using JSP for the frontend and java in the backend using postgreSQL.
