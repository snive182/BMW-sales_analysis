-- check content of database
SELECT * FROM bmw_sales;

-- set Null value to 0
UPDATE BMW_sales
SET Sales_Volume = 0
WHERE Sales_Volume IS NULL;

-- Calculate total sales and revenue
SELECT Year,
       Model,
       SUM(Sales_Volume) AS Total_Sales,
       SUM(Sales_Volume * Price_USD) AS Total_Revenue
FROM BMW_sales
GROUP BY Year, Model
ORDER BY Year, Model;

-- Add a New Column for Sales Category
ALTER TABLE BMW_sales
ADD COLUMN SalesCategory VARCHAR(50);
UPDATE BMW_sales
SET SalesCategory = CASE
    WHEN Sales_Volume < 1000 THEN 'Low'
    WHEN Sales_Volume BETWEEN 1000 AND 5000 THEN 'Medium'
    ELSE 'High'
END;

-- Analyze Sales Trends Over the Years
SELECT Year,
       SUM(Sales_Volume) AS Total_Sales
FROM BMW_sales
GROUP BY Year
ORDER BY Year;