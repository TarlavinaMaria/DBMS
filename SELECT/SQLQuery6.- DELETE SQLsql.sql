DELETE FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%Разработка Windows приложений на языке С++%')

--DELETE FROM Schedule
--WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%Hardware-PC')