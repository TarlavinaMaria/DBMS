USE PD_212

DECLARE @start_lesson_id BIGINT = 
(
SELECT MIN(lesson_id) FROM Schedule, Disciplines, Groups, Attendance
WHERE discipline = discipline_id
AND group_name = 'PD_212' 
AND discipline_name LIKE '%MS SQL%'
AND spent = 1
AND present = 1
)

PRINT (@start_lesson_id)

DECLARE @end_lesson_id BIGINT = 
(
SELECT MAX(lesson_id) FROM Schedule, Disciplines, Groups, Attendance
WHERE discipline = discipline_id
AND group_name = 'PD_212' 
AND discipline_name LIKE '%MS SQL%'
AND spent = 1
AND present = 1
)

PRINT (@end_lesson_id)

DECLARE @lesson_id BIGINT = @start_lesson_id

WHILE (@lesson_id <= @end_lesson_id)
BEGIN
	DECLARE @iterator INT = 1
	WHILE(@iterator <= (SELECT COUNT(stud_id) FROM Students JOIN Groups ON [group]=group_id WHERE group_name='PD_212'))
	BEGIN
	    DECLARE @id INT = (SELECT MAX(stud_id) FROM (SELECT TOP (@iterator) stud_id FROM Students, Groups WHERE [group] = group_id AND group_name = 'PD_212') Students)
		DECLARE @grade1 INT = FLOOR(RAND()*(12-1+1)+1)
		DECLARE @grade2 INT = FLOOR(RAND()*(12-1+1)+1)
		INSERT INTO Grades(student, lesson, grade1, grade2) 
		VALUES (@id, @lesson_id, @grade1, @grade2)
		SET @iterator+=1
	END
	SET @lesson_id+=1
END