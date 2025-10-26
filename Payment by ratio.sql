WITH total_sales AS (SELECT SUM(quantity_sold) AS total_quantity 
  FROM sales),
purchase_type AS (SELECT Purchase_Type, SUM(quantity_sold) AS Purchasetype
  FROM sales
  GROUP BY Purchase_Type)
SELECT  pt.purchase_type, pt.Purchasetype/ts.total_quantity AS ratio
FROM purchase_type pt
JOIN total_sales ts