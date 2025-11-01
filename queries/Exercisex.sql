SELECT st.country, SUM(sl.quantity_sold)
FROM store st
JOIN sales sl ON sl.STOREID = st.StoreID
GROUP BY st.country
ORDER BY SUM(sl.quantity_sold) ASC