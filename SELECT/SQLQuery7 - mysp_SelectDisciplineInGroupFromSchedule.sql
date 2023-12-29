CREATE PROCEDURE dbo.mysp_SelectFromSchedule
--@group NVARCHAR(50),
--@discipline NVARCHAR(50)

AS
BEGIN
	SELECT
			[Группа] = PD_212.dbo.Groups.group_name,
			[Дисциплина] = PD_212.dbo.Disciplines.discipline_name,
			[Кол-во занятий] = COUNT(lesson_id)
		FROM PD_212.dbo.Schedule 
		JOIN PD_212.dbo.Disciplines ON discipline=discipline_id
		JOIN PD_212.dbo.Groups		ON [group] = group_id
		GROUP BY PD_212.dbo.Groups.group_name, PD_212.dbo.Disciplines.discipline_name
	
	
		SELECT 
			PD_212.dbo.Disciplines.discipline_name AS'Дисциплина', 
			PD_212.dbo.Groups.group_name AS 'Группа',
			DATENAME(dw, PD_212.dbo.Schedule.[date]) AS 'День недели',
			PD_212.dbo.Schedule.[date] AS 'Дата',
			PD_212.dbo.Schedule.[time] AS 'Время',
			PD_212.dbo.Teachers.last_name + PD_212.dbo.Teachers.first_name + PD_212.dbo.Teachers.middle_name AS 'Преподаватель',
			--	Можно заголовок задать так
			[Статус] = IIF(Schedule.spent = 1,'Проведено', 'Запланировано')
		FROM
			PD_212.dbo.Schedule, 
			PD_212.dbo.Groups, 
			PD_212.dbo.Disciplines, 
			PD_212.dbo.Teachers
		WHERE
			PD_212.dbo.Schedule.discipline = PD_212.dbo.Disciplines.discipline_id
		AND PD_212.dbo.Schedule.[group] = PD_212.dbo.Groups.group_id
		AND PD_212.dbo.Schedule.teacher = PD_212.dbo.Teachers.teacher_id
END
