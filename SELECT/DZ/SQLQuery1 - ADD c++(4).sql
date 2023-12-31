USE PD_212;
Go

SET DATEFIRST 1
-- DECLARE - ���������� ���������� AS
DECLARE @discipline			SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%������� ���������������%')
DECLARE @teacher			INT		 = 3
DECLARE @group				INT		 = 7
DECLARE @start_date			DATE	 = '2022-01-23'
DECLARE @date				DATE	 = @start_date
DECLARE @interval			INT		 = 2
--DECLARE @interval			INT		 = IIF(DATEPART(dw, @date) = 5, 3, 2)
DECLARE @time				TIME	 = '14:30'
DECLARE @number_of_lessons	TINYINT	 = (SELECT number_of_lessons FROM dbo.Disciplines WHERE discipline_id = @discipline);

DECLARE @counter			INT		 = 0


WHILE (@counter < @number_of_lessons)
BEGIN
	IF(
		SELECT COUNT(*) 
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = @time
		) = 0
		BEGIN
			INSERT INTO Schedule(discipline, teacher, [date], [time], spent, [group])
			VALUES				(@discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0), @group);
		END
		SET			@counter = @counter + 1;
	IF(
		SELECT COUNT(*) 
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = DATEADD(mi, 90, CONVERT(TIME, @time))
		) = 0
		BEGIN
			INSERT INTO Schedule(discipline, teacher, [date], [time], spent, [group])
			VALUES				(@discipline, @teacher, @date, DATEADD(mi, 90, CONVERT(TIME, @time)), IIF(@date < GETDATE(), 1, 0), @group);
		END
		SET			@counter = @counter + 1;
--	SET			@date = @date + @interval
	SET			@date = DATEADD(dd, @interval, @date);
	--SET			@interval = IIF(DATEPART(dw, @date) = 5, 3, 2)
	IF(@interval = 2) SET @interval = 7
	ELSE IF(@interval = 7) SET @interval = 5
	ELSE IF(@interval = 5) SET @interval = 2

END

--INSERT INTO dbo.Schedule(discipline, teacher, [date], [time], spent, [group])
--VALUES					()


SELECT COUNT(*)
FROM Schedule
WHERE 
	[group] = @group
AND [discipline] = @discipline

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
AND dbo.Schedule.discipline = (SELECT discipline_id FROM dbo.Disciplines WHERE discipline_name LIKE '������� ���������������%')

-- LIKE �������� ������
--SELECT * FROM dbo.Disciplines WHERE discipline_name LIKE '%Java%'
--SELECT * FROM dbo.Disciplines WHERE CONTAINS(discipline_name, '%Java%');