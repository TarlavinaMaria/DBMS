USE PD_212;
Go
SELECT 
    Students.last_name AS'�������', 
	Students.first_name AS'���', 
	Students.middle_name AS'��������', 
	DATEDIFF(HOUR, Students.birth_date, GETDATE())/8766 AS '�������',
--	365(���� � ����)*4(���������� ��� ��� � 4 ����) = 1460 +1(����) = 1461 /4 = 365,25 * 24 (����) = 8766
	
	Groops.groop_name AS'������'
	--Directions.direction_name AS'�����������'
FROM   
    Students, 
	Groops,
	Directions
WHERE  
    Students.[groop] = Groops.groop_id
    AND Groops.groop_name = 'PD_212'
	AND Groops.direction = Directions.direction_id
--	AND Directions.direction_name = 'java development'
	AND Directions.direction_name = '���������� ������������ �����������'
	ORDER BY 
--		Students.last_name DESC;
		Students.birth_date DESC;
--	ASC - Ascending (� ������� �����������)
--	DESC - Descending(� ������� ��������)