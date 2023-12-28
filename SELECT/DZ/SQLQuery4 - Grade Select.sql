--DELETE FROM Grades
USE PD_212
SET DATEFIRST 1
SELECT
	[Студент] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[Группа] = Groups.group_name,
	[День недели] = DATENAME(dw, Schedule.[date]),
	[Дата] = Schedule.[date],
	[Время] = Schedule.[time],
	[Оценка 1] = grade1,
	[Оценка 2] = grade2,
	[Дисциплина] = Disciplines.discipline_name,
	[Присутствие] = IIF(Attendance.present = 1, 'Был', 'Прогулял')
FROM 
	Schedule, Students, Groups, Disciplines, Grades, Attendance
WHERE
	Grades.student = Students.stud_id
AND Grades.lesson = Schedule.lesson_id
AND Attendance.student = Students.stud_id
AND Attendance.lesson = Schedule.lesson_id
AND Schedule.discipline = Disciplines.discipline_id
AND Schedule.[group] = Groups.group_id
AND Schedule.[date] = '2023-12-18'
AND Schedule.[time] = '14:30'