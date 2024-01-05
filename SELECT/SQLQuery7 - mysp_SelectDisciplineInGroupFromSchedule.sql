ALTER PROCEDURE mysp_SelectFromSchedule
--@group NVARCHAR(50),
--@discipline NVARCHAR(50)

AS
BEGIN
	SELECT
			[������] = PD_212.dbo.Groups.group_name,
			[����������] = PD_212.dbo.Disciplines.discipline_name,
			[���-�� �������] = COUNT(lesson_id)
		FROM PD_212.dbo.Schedule 
		JOIN PD_212.dbo.Disciplines ON discipline=discipline_id
		JOIN PD_212.dbo.Groups		ON [group] = group_id
		GROUP BY PD_212.dbo.Groups.group_name, PD_212.dbo.Disciplines.discipline_name
	
	
		SELECT 
			PD_212.dbo.Disciplines.discipline_name AS'����������', 
			PD_212.dbo.Groups.group_name AS '������',
			DATENAME(dw, PD_212.dbo.Schedule.[date]) AS '���� ������',
			PD_212.dbo.Schedule.[date] AS '����',
			PD_212.dbo.Schedule.[time] AS '�����',
			PD_212.dbo.Teachers.last_name + PD_212.dbo.Teachers.first_name + PD_212.dbo.Teachers.middle_name AS '�������������',
			--	����� ��������� ������ ���
			[������] = IIF(Schedule.spent = 1,'���������', '�������������')
		FROM
			PD_212.dbo.Schedule, 
			PD_212.dbo.Groups, 
			PD_212.dbo.Disciplines, 
			PD_212.dbo.Teachers
		WHERE
			PD_212.dbo.Schedule.discipline = PD_212.dbo.Disciplines.discipline_id
		AND PD_212.dbo.Schedule.[group] = PD_212.dbo.Groups.group_id
		AND PD_212.dbo.Schedule.teacher = PD_212.dbo.Teachers.teacher_id
		---------------------------------------------------------------------------------------------------------------------------------
		SET DATEFIRST 1
		SELECT
			[�������] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
			[������] = Groups.group_name,
			[���� ������] = DATENAME(dw, Schedule.[date]),
			[����] = Schedule.[date],
			[�����] = Schedule.[time],
			[������ 1] = grade1,
			[������ 2] = grade2,
			[����������] = Disciplines.discipline_name,
			[�����������] = IIF(Attendance.present = 1, '���', '��������')
		FROM 
			Schedule, Students, Groups, Disciplines, Grades, Attendance
		WHERE
			Grades.student = Students.stud_id
		AND Grades.lesson = Schedule.lesson_id
		AND Attendance.student = Students.stud_id
		AND Attendance.lesson = Schedule.lesson_id
		AND Schedule.discipline = Disciplines.discipline_id
		AND Schedule.[group] = Groups.group_id
END
