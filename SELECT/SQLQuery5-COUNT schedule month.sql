USE PD_212
Go

SELECT 
	[Преподаватель] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[Кол-во занятий среднее] = COUNT(Schedule.teacher)/12.0
FROM 
	dbo.Schedule,dbo.Teachers
WHERE
	Schedule.teacher = Teachers.teacher_id
AND [date] BETWEEN'2023-01-01' AND '2023-12-31'
GROUP BY 
	Teachers.last_name, Teachers.first_name, Teachers.middle_name
