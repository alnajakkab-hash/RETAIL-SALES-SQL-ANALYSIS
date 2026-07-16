# 🛒 Retail Sales SQL Analysis

## 📌 Project Overview

This project presents a comprehensive SQL analysis of the **Olist Brazilian E-Commerce Dataset** using **MySQL**. The goal is to analyze sales performance, customer behavior, seller performance, payment trends, and delivery performance to generate meaningful business insights.

The project demonstrates practical SQL skills, including data cleaning, joins, aggregate functions, subqueries, Common Table Expressions (CTEs), window functions, views, and business analysis queries. It is designed as a portfolio project to showcase SQL proficiency for Data Analyst and Business Analyst roles.

## 📊 Dataset

This project uses the **Olist Brazilian E-Commerce Public Dataset**, which contains information about customers, orders, sellers, products, payments, reviews, and geolocations from a Brazilian e-commerce platform.

### Tables Used

- Customer
- Orders
- Order Items
- Order Payments
- Products
- Sellers
- Geolocation

The dataset contains over **100,000** e-commerce orders, making it suitable for practicing SQL queries and business analysis.

## 🛠 Tools & Technologies

- **Database:** MySQL 8.0
- **SQL IDE:** MySQL Command Line Client
- **Code Editor:** Visual Studio Code
- **Dataset:** Olist Brazilian E-Commerce Dataset
- **Version Control:** Git & GitHub

## 📂 Project Structure

```
Retail-Sales-SQL-Analysis/
│
├── Dataset/
│   ├── olist_customers_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_payments_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_sellers_dataset.csv
│   ├── olist_geolocation_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   └── product_category_name_translation.csv
│
├── SQL Scripts/
│   ├── 01_Database_Creation.sql
│   ├── 02_Table_Creation.sql
│   ├── 03_Data_Loading.sql
│   ├── 04_Data_Cleaning_Validation.sql
│   ├── 05_Order_Analysis.sql
│   ├── 06_Sales_Analysis.sql
│   ├── 07_Product_Analysis.sql
│   ├── 08_Customer_Analysis.sql
│   ├── 09_Seller_Analysis.sql
│   ├── 10_Payment_Analysis.sql
│   ├── 11_Delivery_Analysis.sql
│   ├── 12_Window_Functions.sql
│   ├── 13_CTEs.sql
│   ├── 14_Views.sql
│   └── 15_Business_Insights.sql
│
├── Screenshots/
│   ├── 01_Tables.png
│   ├── 02_Monthly_Revenue.png
│   ├── 03_Top_Product_Categories.png
│   ├── 04_Top_Sellers_Revenue.png
│   ├── 05_Customer_Distribution_State.png
│   ├── 06_Payment_Analysis.png
│   ├── 07_Delivery_Performance.png
│   ├── 08_Window_Function_Rank.png
│   ├── 09_CTE_Analysis.png
│   └── 10_View_Analysis.png
│
└── README.md
```
## 📈 SQL Concepts Used

Throughout this project, the following SQL concepts were applied:

- Database and Table Creation (DDL)
- Data Loading and Validation
- Data Cleaning
- Primary Keys and Foreign Keys
- INNER JOIN
- Aggregate Functions (`COUNT()`, `SUM()`, `AVG()`)
- `GROUP BY` and `HAVING`
- `ORDER BY`
- Date Functions (`YEAR()`, `MONTH()`)
- Subqueries
- Window Functions (`ROW_NUMBER()`, `RANK()`, `LAG()`)
- Common Table Expressions (CTEs)
- SQL Views
- Business Analysis Queries

## 📋 Business Questions Solved

This project answers several real-world business questions, including:

1. What is the monthly sales revenue?
2. Which product categories generate the highest sales?
3. Who are the top-performing sellers?
4. Which states have the highest number of customers?
5. Which payment methods are most frequently used?
6. What is the average payment amount by payment type?
7. What is the distribution of order statuses?
8. How can sellers be ranked using Window Functions?
9. How can CTEs simplify complex SQL queries?
10. How can SQL Views improve query reusability?
 
## 💡 Key Insights

- Identified monthly revenue trends across the dataset.
- Determined the best-selling product categories.
- Ranked sellers based on total revenue generated.
- Analyzed customer distribution across different states.
- Compared payment methods based on transaction count and revenue.
- Evaluated order status distribution to understand delivery performance.
- Applied Window Functions and CTEs to solve analytical business problems efficiently.

## 📷 Project Screenshots

The `Screenshots` folder contains important query outputs demonstrating:

- Database tables
- Monthly revenue analysis
- Product category analysis
- Seller performance
- Customer distribution
- Payment analysis
- Delivery performance
- Window Functions
- Common Table Expressions (CTEs)
- SQL Views

## 📚 Learning Outcomes

Through this project, I strengthened my understanding of:

- Writing efficient SQL queries
- Working with relational databases
- Performing data cleaning and validation
- Analyzing business data using SQL
- Using Window Functions, CTEs, and Views
- Applying SQL to solve real-world business problems

This project was completed as part of my SQL learning journey and helped me build a strong foundation in SQL for data analytics.

## 👩‍💻 About Me

**Anna Alna Jakkab**

MSc Data Analytics graduate with skills in SQL, Python, Power BI, and Machine Learning.

This project was developed as part of my SQL learning journey using the Olist Brazilian E-Commerce dataset. It demonstrates my understanding of SQL fundamentals, including joins, aggregate functions, subqueries, window functions, CTEs, views, and business-oriented data analysis.
