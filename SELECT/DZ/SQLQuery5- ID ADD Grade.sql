USE PD_212

DECLARE @start_lesson_id BIGINT = 
(
SELECT MIN(lesson_id) FROM Schedule, Disciplines, Groups 
WHERE discipline = discipline_id
AND group_name = 'PD_212' 
AND discipline_name LIKE '%MS SQL%'
AND spent = 1
)
PRINT (@start_lesson_id)

DECLARE @end_lesson_id BIGINT = 
(
SELECT MAX(lesson_id) FROM Schedule, Disciplines, Groups 
WHERE discipline = discipline_id
AND group_name = 'PD_212' 
AND discipline_name LIKE '%MS SQL%'
AND spent = 1
)
PRINT (@end_lesson_id)

DECLARE @lesson_id BIGINT = @start_lesson_id
WHILE (@lesson_id <= @end_lesson_id)
BEGIN
DECLARE @iterator INT = 1
	WHILE(@iterator <= (SELECT COUNT(stud_id)FROM Students JOIN Groups ON [group]=group_id WHERE group_name='PD_212'))
	BEGIN
	    DECLARE @id INT = (SELECT MAX(stud_id) FROM (SELECT TOP (@iterator) stud_id FROM Students, Groups WHERE [group] = group_id AND group_name = 'PD_212') Students)
		--IF(@id = (SELECT COUNT(student) FROM Attendance WHERE lesson = @lesson_id AND student = @id AND present = 0))
		--BEGIN
		--	INSERT INTO Grades(student, lesson, grade1, grade2) 
		--	VALUES (@id, @lesson_id, 0, 0)
		--END
		--ELSE
		--BEGIN
			DECLARE @grade1 TINYINT = FLOOR(RAND()*(12-1+1)+1)
			DECLARE @grade2 TINYINT = FLOOR(RAND()*(12-1+1)+1)
			INSERT INTO Grades(student, lesson, grade1, grade2) 
			VALUES (@id, @lesson_id, @grade1, @grade2)
		--END
		SET @iterator+=1
	END
	SET @lesson_id+=1
END
