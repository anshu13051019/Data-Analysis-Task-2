SELECT * FROM sales_data;

SELECT * FROM sales_data
WHERE Category = 'Electronics';

SELECT * FROM sales_data
ORDER BY Sales DESC;

SELECT * FROM sales_data
ORDER BY Sales DESC
LIMIT 3;

SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category;

SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
HAVING SUM(Sales) > 10000;

SELECT *
FROM sales_data
WHERE Sales > (
    SELECT AVG(Sales)
    FROM sales_data
);

WITH SalesCTE AS (
    SELECT Category, SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Category
)
SELECT * FROM SalesCTE;

SELECT Product,
       Sales,
       ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Num
FROM sales_data;

SELECT Product,
       Sales,
       RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM sales_data;

SELECT Product,
       Sales,
       LAG(Sales) OVER (ORDER BY Sales) AS Previous_Sales
FROM sales_data;

SELECT Product,
       Sales,
       LEAD(Sales) OVER (ORDER BY Sales) AS Next_Sales
FROM sales_data;

CREATE VIEW Sales_View AS
SELECT Product, Category, Sales
FROM sales_data;

SELECT * FROM Sales_View;
