DELETE FROM Schedule
WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%���������� Windows ���������� �� ����� �++%')

--DELETE FROM Schedule
--WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%Hardware-PC')