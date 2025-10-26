SELECT invoice_number,
ROW_NUMBER() OVER(PARTITION BY invoice_number) AS rownumber
FROM SALES

SELECT * FROM (SELECT invoice_number,
ROW_NUMBER() OVER(PARTITION BY invoice_number) AS rownumber
FROM SALES) AS duplicates_table
WHERE rownumber > 1