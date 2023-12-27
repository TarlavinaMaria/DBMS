USE PD_212;
Go

SELECT 
	[Дисциплина] = Disciplines.discipline_name,
	[Количество занятий] = COUNT(discipline),
	[Количество занятий проеденных] = SUM(CASE WHEN spent = 1 THEN 1 ELSE 0 END),
	[Количество занятий запланированных] = SUM(CASE WHEN spent = 0 THEN 1 ELSE 0 END)
FROM 
	dbo.Schedule,dbo.Disciplines
WHERE 
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
GROUP BY Disciplines.discipline_name