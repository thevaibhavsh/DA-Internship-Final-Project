-- Clean missing/null records
DELETE FROM global_superstore
WHERE Sales IS NULL OR Profit IS NULL OR Category IS NULL;

-- Profit margins by category
SELECT Category, 
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       (SUM(Profit)/SUM(Sales))*100 AS Profit_Margin_Percent
FROM global_superstore
GROUP BY Category;

-- Profit margins by sub-category
SELECT Category, Sub_Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       (SUM(Profit)/SUM(Sales))*100 AS Profit_Margin_Percent
FROM global_superstore
GROUP BY Category, Sub_Category;

-- Inventory turnover (assuming Days_In_Inventory field exists)
SELECT Category, AVG(Days_In_Inventory) AS Avg_Inventory_Days
FROM global_superstore
GROUP BY Category;
