USE PD_212
Go

SELECT 
	[�������������] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[���-�� ������� � ����������] = COUNT(Schedule.teacher),
	[���-�� ������������� �������] = SUM(CASE WHEN Schedule.spent = 1 THEN 1 ELSE 0 END),
	[���-�� ��������������� �������] = SUM(CASE WHEN Schedule.spent = 0 THEN 1 ELSE 0 END)
FROM 
	dbo.Schedule,dbo.Teachers
WHERE
	Schedule.teacher = Teachers.teacher_id
AND [date] BETWEEN'2023-12-01' AND '2023-12-31'
GROUP BY 
	Teachers.last_name, Teachers.first_name, Teachers.middle_name
