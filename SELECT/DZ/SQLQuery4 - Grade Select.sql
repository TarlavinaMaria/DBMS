--DELETE FROM Grades
USE PD_212
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
AND Schedule.[date] = '2023-12-18'
AND Schedule.[time] = '14:30'