USE PD_212;
Go

SELECT COUNT(*) AS 'Проведено Ковтун'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Ковтун%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS 'Запланировно Ковтун'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Ковтун%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'Проведено Покидюк'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Покидюк%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS 'Запланировно Покидюк'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Покидюк%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'Проведено Кобылинский'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Кобылинский%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS 'Запланировно Кобылинский'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Кобылинский%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------------
--SELECT 
--	dbo.Disciplines.discipline_name AS'Дисциплина', 
--	dbo.Groups.group_name AS 'Группа',
--	DATENAME(dw, dbo.Schedule.[date]) AS 'День недели',
--	dbo.Schedule.[date] AS 'Дата',
--	dbo.Schedule.[time] AS 'Время',
--	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
--	--	Можно заголовок задать так
--	[Статус] = IIF(Schedule.spent = 1,'Проведено', 'Запланировано')
--FROM
--	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
--WHERE
--	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%Кобылинский%')
