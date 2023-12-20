SELECT 
	dbo.Disciplines.discipline_name AS'Дисциплина', 
	dbo.Groups.group_name AS 'Группа',
	dbo.Schedule.[date] AS 'Дата',
	dbo.Schedule.[time] AS 'Время',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS 'Преподаватель',
	dbo.Schedule.spent AS 'Проведено ' 
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers;
