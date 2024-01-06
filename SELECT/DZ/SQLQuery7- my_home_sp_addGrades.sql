
ALTER PROCEDURE my_home_sp_addGrades
@group_name_select NVARCHAR(50),
@discipline_select NVARCHAR(50)
AS
BEGIN
	DECLARE @start_lesson_id BIGINT = 
	(
	SELECT MIN(lesson_id) FROM PD_212.dbo.Schedule, PD_212.dbo.Disciplines, PD_212.dbo.Students, PD_212.dbo.Groups
	WHERE discipline = discipline_id
	AND group_name = @group_name_select 
	AND discipline_name LIKE @discipline_select
	AND spent = 1
	)
	--PRINT (@start_lesson_id)
	
	DECLARE @end_lesson_id BIGINT = 
	(
	SELECT MAX(lesson_id) FROM PD_212.dbo.Schedule, PD_212.dbo.Disciplines, PD_212.dbo.Students, PD_212.dbo.Groups
	WHERE discipline = discipline_id
	AND group_name = @group_name_select
	AND discipline_name LIKE @discipline_select
	AND spent = 1
	)
	--PRINT (@end_lesson_id)
	
	DECLARE @lesson_id BIGINT = @start_lesson_id
	WHILE (@lesson_id <= @end_lesson_id)
	BEGIN
		DECLARE @iterator INT = 1
		WHILE(@iterator <= (SELECT COUNT(stud_id) FROM PD_212.dbo.Students JOIN PD_212.dbo.Groups ON [group]=group_id WHERE group_name = @group_name_select))
		BEGIN
		    DECLARE @id INT = (SELECT MAX(stud_id) FROM (SELECT TOP (@iterator) stud_id FROM PD_212.dbo.Students, PD_212.dbo.Groups WHERE [group] = group_id AND group_name = @group_name_select) Students)
			DECLARE @grade1 TINYINT = FLOOR(RAND()*(12-1+1)+1)
			DECLARE @grade2 TINYINT = FLOOR(RAND()*(12-1+1)+1)
			INSERT INTO PD_212.dbo.Grades(student, lesson, grade1, grade2) 
			VALUES (@id, @lesson_id, @grade1, @grade2)
			SET @iterator+=1
		END
		SET @lesson_id+=1
	END
END