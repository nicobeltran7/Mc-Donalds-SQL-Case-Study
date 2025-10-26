SELECT product_Name, ROUND(AVG(Price))
FROM sales
GROUP BY product_Name