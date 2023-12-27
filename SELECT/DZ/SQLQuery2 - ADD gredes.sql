USE PD_212;

DECLARE @student INT = 2
DECLARE @min BIGINT = 565
DECLARE @max BIGINT = 584
DECLARE @lessons BIGINT = FLOOR(RAND()*(@max-@min+1)+@min)
DECLARE @grade1 TINYINT = FLOOR(RAND()*(12-1+1)+1)
DECLARE @grade2 TINYINT = FLOOR(RAND()*(12-1+1)+1)
DECLARE @counter			INT		 = 0

WHILE (@counter < 10)
BEGIN
	--IF(
	--	SELECT COUNT(stud_id) 
	--	FROM Schedule, Students
	--	WHERE lesson_id = @lessons AND stud_id = @student
	--	) = 0
	--	BEGIN
			INSERT INTO Grades(student, lesson, grade1, grade2)
			VALUES (@student, @lessons, @grade1, @grade2)
		--END
		SET			@counter = @counter + 1
END
--SELECT 
--	[Студент] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
--	[Урок] = Schedule.lesson_id,
--	[Оценка 1] = Grades.grade1,
--	[Оценка 2] = Grades.grade2
--FROM 
--	dbo.Students, dbo.Grades, dbo.Schedule
--WHERE
--	Grades.student = Students.stud_id
--GROUP BY 
--	Students.last_name, Students.first_name, Students.middle_name, grade1, grade2, lesson_id

