USE PD_212

SELECT
	[Студент] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[Посещаемость] = SUM(CASE WHEN Attendance.present = 1 THEN 1 ELSE 0 END),
	[Оценка 1] = AVG(grade1),
	[Оценка 2] = AVG(grade2)
FROM 
	Schedule, Students, Disciplines, Grades, Attendance
WHERE
	Grades.student = Students.stud_id
AND Attendance.student = Students.stud_id
AND Schedule.discipline = Disciplines.discipline_id
GROUP BY 
		Students.last_name, Students.first_name, Students.middle_name
ORDER BY
		[Оценка 1] DESC,
		[Оценка 2] DESC,
		Посещаемость DESC