USE PD_212;
Go
SELECT 
    Students.last_name AS'Фамилия', 
	Students.first_name AS'Имя', 
	Students.middle_name AS'Отчество', 
	DATEDIFF(HOUR, Students.birth_date, GETDATE())/8766 AS 'Возраст',
--	365(дней в году)*4(високосный год раз в 4 года) = 1460 +1(день) = 1461 /4 = 365,25 * 24 (часа) = 8766
	
	Groops.groop_name AS'Группа'
	--Directions.direction_name AS'Направление'
FROM   
    Students, 
	Groops,
	Directions
WHERE  
    Students.[groop] = Groops.groop_id
    AND Groops.groop_name = 'PD_212'
	AND Groops.direction = Directions.direction_id
--	AND Directions.direction_name = 'java development'
	AND Directions.direction_name = 'Разработка программного обеспечения'
	ORDER BY 
--		Students.last_name DESC;
		Students.birth_date DESC;
--	ASC - Ascending (в порядке возрастания)
--	DESC - Descending(в порядке убывания)