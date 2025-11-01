SELECT Product_Name, SUM(quantity_sold) AS Quantity
FROM sales
GROUP BY Product_Name
ORDER BY Quantity DESC