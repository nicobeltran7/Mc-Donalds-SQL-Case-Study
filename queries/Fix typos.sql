SELECT DISTINCT product_name
FROM sales
ORDER BY product_name ASC

UPDATE sales
SET product_name = 'Burgers'
WHERE product_name = 'Burger'

UPDATE sales
SET quantity_sold = CEILING(quantity_sold)