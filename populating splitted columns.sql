UPDATE store
SET city = SUBSTRING_INDEX(country_city,'-',-1)

UPDATE store
SET country = SUBSTRING_INDEX(country_city,'-',1)

