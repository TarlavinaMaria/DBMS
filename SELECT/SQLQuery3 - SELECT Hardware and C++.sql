SELECT 
	dbo.Disciplines.discipline_name AS'����������', 
	dbo.Groups.group_name AS '������',
	dbo.Schedule.[date] AS '����',
	dbo.Schedule.[time] AS '�����',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
--	����� ��������� ������ ���
	[������] = IIF(Schedule.spent = 1,'���������', '�������������')
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%���������� Windows ���������� �� ����� �++%')

SELECT 
	dbo.Disciplines.discipline_name AS'����������', 
	dbo.Groups.group_name AS '������',
	dbo.Schedule.[date] AS '����',
	dbo.Schedule.[time] AS '�����',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
--	����� ��������� ������ ���
	[������] = IIF(Schedule.spent = 1,'���������', '�������������')
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%Hardware-PC%')

--SELECT 
--	dbo.Disciplines.discipline_name AS'����������', 
--	dbo.Groups.group_name AS '������',
--	dbo.Schedule.[date] AS '����',
--	dbo.Schedule.[time] AS '�����',
--	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
----	����� ��������� ������ ���
--	[������] = IIF(Schedule.spent = 1,'���������', '�������������')
--FROM
--	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
--WHERE
--	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teachers.teacher_id
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '%Java')
