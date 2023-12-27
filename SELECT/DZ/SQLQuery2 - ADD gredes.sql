USE PD_212;

DECLARE @student INT = (SELECT TOP 1 stud_id FROM Students WHERE stud_id IS NOT NULL ORDER BY NEWID())
DECLARE @lessons INT = (SELECT TOP 1 lesson_id FROM Schedule WHERE lesson_id IS NOT NULL ORDER BY NEWID())
DECLARE @grade1 INT = FLOOR(RAND()*(12-1+1)+1)
DECLARE @grade2 INT = FLOOR(RAND()*(12-1+1)+1)
DECLARE @counter			INT		 = 0

WHILE (@counter < 10)
		BEGIN
			INSERT INTO dbo.Grades(student, lesson, grade1, grade2)
			VALUES (@student, @lessons, @grade1, @grade2)
		END
		SET			@counter = @counter + 1

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

