/* View Sample Data */
USE retail_db;

SELECT*
FROM sales
LIMIT 5;

/* Total Sales : write down the result */
SELECT 
ROUND(SUM(sales),2) AS total_sales
From sales;


/* Top 10 Products */
SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS total_sales

FROM sales

GROUP BY `Product Name`

ORDER BY total_sales DESC

LIMIT 10;

/* Region Performance */
SELECT 
Region,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM sales

GROUP BY Region

ORDER BY total_sales DESC;


/* Category Profitability */

SELECT 

category,

ROUND(SUM(Profit),2) AS total_profit

FROM sales

GROUP BY Category

ORDER BY total_profit DESC;

/* Discount Impact */

SELECT 

Discount,

ROUND(AVG(Profit),2) AS avg_profit

FROM sales 

GROUP BY Discount

ORDER BY Discount;


/* Monthly Sales Trend */

SELECT

MONTH(COALESCE(STR_TO_DATE(`Order Date`,'%d-%m-%Y'),
STR_TO_DATE(`Order Date`,'%m/%d/%Y'))) AS month_num,

ROUND(SUM(Sales),2) AS monthly_sales

FROM sales

GROUP BY month_num

ORDER BY month_num;

/* Window Function(great for interview) */

SELECT 

Sales,

SUM(sales)
OVER(ORDER BY sales) AS running_sales

FROM sales

LIMIT 20;

