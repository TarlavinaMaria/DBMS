SELECT 
	dbo.Disciplines.discipline_name AS'Дисциплина', 
	dbo.Groups.group_name AS 'Группа',
	dbo.Schedule.[date] AS 'Дата',
	dbo.Schedule.[time] AS 'Время',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
--	Можно заголовок задать так
	[Статус] = IIF(Schedule.spent = 1,'Проведено', 'Запланировано')
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%Разработка Windows приложений на языке С++%')

SELECT 
	dbo.Disciplines.discipline_name AS'Дисциплина', 
	dbo.Groups.group_name AS 'Группа',
	dbo.Schedule.[date] AS 'Дата',
	dbo.Schedule.[time] AS 'Время',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
--	Можно заголовок задать так
	[Статус] = IIF(Schedule.spent = 1,'Проведено', 'Запланировано')
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%Hardware-PC%')

--SELECT 
--	dbo.Disciplines.discipline_name AS'Дисциплина', 
--	dbo.Groups.group_name AS 'Группа',
--	dbo.Schedule.[date] AS 'Дата',
--	dbo.Schedule.[time] AS 'Время',
--	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
----	Можно заголовок задать так
--	[Статус] = IIF(Schedule.spent = 1,'Проведено', 'Запланировано')
--FROM
--	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
--WHERE
--	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%Java')
