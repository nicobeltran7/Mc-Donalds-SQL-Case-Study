WITH sales1 AS(SELECT SUM(Price*quantity_sold) AS Revenue,
SUM(cost_per_unit*quantity_sold) AS Cost
FROM sales)
SELECT ROUND(Revenue), ROUND(Cost), ROUND((Revenue-Cost)) AS TotalProfit
FROM sales1