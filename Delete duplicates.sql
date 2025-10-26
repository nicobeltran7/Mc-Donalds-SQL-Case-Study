DELETE FROM sales
WHERE id IN(
	SELECT id FROM(
		SELECT id,
		ROW_NUMBER() OVER(PARTITION BY invoice_number) AS rownumber 
		FROM sales) AS duplicates_table
WHERE rownumber > 1)