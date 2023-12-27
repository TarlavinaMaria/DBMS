USE PD_212;
Go

SELECT COUNT(*) AS '��������� ������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%������%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS '������������ ������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%������%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS '��������� �������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%�������%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS '������������ �������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%�������%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS '��������� �����������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%�����������%')
AND dbo.Schedule.spent = 1
AND dbo.Schedule.[date] >= '2022-12-01' 
AND dbo.Schedule.[date] <= '2022-12-31' 

SELECT COUNT(*) AS '������������ �����������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers 
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%�����������%')
AND dbo.Schedule.spent = 0
AND dbo.Schedule.[date] >= '2022-12-31' 
-------------------------------------------------------------------------------------------------------------
--SELECT 
--	dbo.Disciplines.discipline_name AS'����������', 
--	dbo.Groups.group_name AS '������',
--	DATENAME(dw, dbo.Schedule.[date]) AS '���� ������',
--	dbo.Schedule.[date] AS '����',
--	dbo.Schedule.[time] AS '�����',
--	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
--	--	����� ��������� ������ ���
--	[������] = IIF(Schedule.spent = 1,'���������', '�������������')
--FROM
--	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
--WHERE
--	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.teacher = (SELECT teacher_id FROM Teachers WHERE last_name LIKE '%�����������%')
