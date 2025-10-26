SELECT s.general_manager, s.age, s.sex, s.tenure, s.City, t.amounts
FROM store s
JOIN theft t ON t.StoreID = S.StoreID
WHERE t.Amounts > 10