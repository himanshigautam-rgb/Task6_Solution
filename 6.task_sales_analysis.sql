
-- TASK 6: Sales Trend Analysis Using Aggregations

-- Create table
CREATE TABLE online_sales (
    order_id VARCHAR(255),
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(255)
);

-- Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    year, month;

-- Top 3 Months by Revenue
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    year_month
ORDER BY 
    total_revenue DESC
LIMIT 3;
