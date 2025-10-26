SELECT country_city, SUBSTRING_INDEX(country_city,'-',1) AS Country ,SUBSTRING_INDEX(country_city,'-',-1) AS City
FROM store

