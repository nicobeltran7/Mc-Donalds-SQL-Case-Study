WITH total_sales AS (
    SELECT SUM(quantity_sold) AS total_quantity FROM sales),
method_totals AS (
    SELECT Payment_Method, SUM(quantity_sold) AS method_quantity
    FROM sales
    GROUP BY Payment_Method)
SELECT mt.Payment_Method,mt.method_quantity / ts.total_quantity AS percentage_of_total
FROM method_totals mt
JOIN total_sales ts


