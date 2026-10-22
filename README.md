# Ecommerce Customer Insights

## Project Overview
This project analyzes ecommerce customer purchasing behavior using Python, SQL Server, and Power BI. The goal is to explore revenue patterns, shopping preferences, discount usage, and customer satisfaction through data analysis and interactive visualizations.

## Tools and Technologies
- **Python:** Pandas for data cleaning and preprocessing
- **SQL Server:** SQL queries for KPI analysis
- **Power BI:** Interactive dashboard and data visualization

## Dataset
The dataset contains approximately 1,000 records and 28 columns, including customer demographics, purchase amount, purchase category, purchase channel, customer satisfaction, product rating, and discount usage.

## Project Workflow
1. Cleaned and prepared the dataset using Python and Pandas.
2. Checked missing values, duplicate records, data types, and date formatting.
3. Loaded the cleaned data into SQL Server.
4. Wrote SQL queries to analyze customer behavior and business KPIs.
5. Built an interactive Power BI dashboard with KPI cards, charts, a decomposition tree, and slicers.

## SQL Analysis
The project includes 10 SQL analysis tasks:
1. Customer distribution by gender
2. Revenue by purchase category
3. Average purchase amount by channel
4. Loyalty program member comparison
5. Purchases above the overall average
6. Top 3 purchase categories by revenue within each channel
7. Discount usage and percentage of records
8. Customer satisfaction by purchase channel
9. Monthly revenue trends
10. Purchase ranking and customer grouping using `NTILE(3)`

## Power BI Dashboard
The dashboard includes:
- Total customers
- Total revenue
- Average purchase amount
- Average product rating
- Revenue by gender and purchase category
- Customer distribution by purchase channel
- Monthly revenue trends
- Customer satisfaction by purchase channel
- Purchase amount decomposition by customer behavior
- Interactive slicers for gender, purchase category, purchase channel, and discount usage

## Key Learning
This project provided practical experience in data cleaning, SQL-based analysis, and interactive dashboard development. It demonstrates how Python, SQL Server, and Power BI can be combined in an end-to-end data analytics workflow.

## Project Files
- `Ecommerce.ipynb` — Python data preparation
- `customer_analysis.sql` — SQL analysis queries
- `customer behavior project.pbix` — Power BI report
- `dashboard.png` — Dashboard screenshot

## Note
This is a learning project using an ecommerce customer behavior dataset. Findings should be interpreted in the context of the available dataset.
