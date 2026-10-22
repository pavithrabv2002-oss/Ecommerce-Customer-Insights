/*
Project: Ecommerce Customer Insights
Database: customer_Behavior
Table: dbo.customer

This file contains the 10 SQL KPIs practised for the project.
*/

-- KPI 1: Customer distribution by gender
SELECT
    Gender,
    COUNT(*) AS total_customers
FROM dbo.customer
GROUP BY Gender
ORDER BY total_customers DESC;


-- KPI 2: Revenue by purchase category
SELECT
    Purchase_Category,
    SUM(Purchase_Amount) AS total_revenue
FROM dbo.customer
GROUP BY Purchase_Category
ORDER BY total_revenue DESC;


-- KPI 3: Average purchase amount by channel (channels above 250)
SELECT
    Purchase_Channel,
    AVG(Purchase_Amount) AS average_purchase_amount
FROM dbo.customer
GROUP BY Purchase_Channel
HAVING AVG(Purchase_Amount) > 250
ORDER BY average_purchase_amount DESC;


-- KPI 4: Loyalty program member comparison
SELECT
    Customer_Loyalty_Program_Member,
    COUNT(*) AS total_records,
    AVG(Purchase_Amount) AS average_purchase_amount,
    SUM(Purchase_Amount) AS total_revenue
FROM dbo.customer
GROUP BY Customer_Loyalty_Program_Member;


-- KPI 5: Customers whose purchase amount is above the overall average
SELECT
    Customer_ID,
    Purchase_Amount,
    Purchase_Category,
    Purchase_Channel
FROM dbo.customer
WHERE Purchase_Amount > (
    SELECT AVG(Purchase_Amount)
    FROM dbo.customer
)
ORDER BY Purchase_Amount DESC;


-- KPI 6: Top 3 purchase categories by revenue within each channel
WITH CategoryRevenue AS (
    SELECT
        Purchase_Channel,
        Purchase_Category,
        SUM(Purchase_Amount) AS total_revenue
    FROM dbo.customer
    GROUP BY
        Purchase_Channel,
        Purchase_Category
),
RankedCategories AS (
    SELECT
        Purchase_Channel,
        Purchase_Category,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Purchase_Channel
            ORDER BY total_revenue DESC
        ) AS category_rank
    FROM CategoryRevenue
)
SELECT
    Purchase_Channel,
    Purchase_Category,
    total_revenue,
    category_rank
FROM RankedCategories
WHERE category_rank <= 3
ORDER BY Purchase_Channel, category_rank;


-- KPI 7: Discount usage analysis and percentage of all records
SELECT
    Discount_Used,
    COUNT(*) AS total_records,
    AVG(Purchase_Amount) AS average_purchase_amount,
    SUM(Purchase_Amount) AS total_revenue,
    CAST(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.customer)
        AS DECIMAL(5, 2)
    ) AS percentage_of_all_records
FROM dbo.customer
GROUP BY Discount_Used
ORDER BY Discount_Used;


-- KPI 8: Customer satisfaction by purchase channel
SELECT
    Purchase_Channel,
    AVG(Customer_Satisfaction) AS average_satisfaction
FROM dbo.customer
GROUP BY Purchase_Channel
ORDER BY average_satisfaction DESC;


-- KPI 9: Monthly revenue trends
SELECT
    YEAR(Time_of_Purchase) AS purchase_year,
    MONTH(Time_of_Purchase) AS purchase_month,
    SUM(Purchase_Amount) AS monthly_revenue,
    COUNT(*) AS total_records,
    AVG(Purchase_Amount) AS average_purchase_amount
FROM dbo.customer
GROUP BY
    YEAR(Time_of_Purchase),
    MONTH(Time_of_Purchase)
ORDER BY
    purchase_year,
    purchase_month;


-- KPI 10: Customer purchase ranking and grouping using NTILE(3)
SELECT
    Customer_ID,
    Purchase_Amount,
    DENSE_RANK() OVER (
        ORDER BY Purchase_Amount DESC
    ) AS purchase_rank,
    NTILE(3) OVER (
        ORDER BY Purchase_Amount DESC
    ) AS customer_group
FROM dbo.customer
ORDER BY purchase_rank;
