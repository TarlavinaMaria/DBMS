USE PD_212

--DELETE
--FROM Schedule
--WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = 'Java_326')

SELECT
	group_name AS 'Группа',
	COUNT([group]) AS 'Кол-во занятий'
FROM Schedule JOIN Groups ON [group] = group_id
WHERE	spent=1 
--AND		discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
GROUP BY group_name

SELECT
	group_name AS 'Группа',
	[Кол-во занятий] = 
		COUNT(stud_id)/(SELECT COUNT(stud_id) FROM Students JOIN Groups ON [group] = group_id WHERE group_name = 'Java_326')
FROM Schedule JOIN Groups ON [group] = group_id
JOIN Attendance ON lesson = lesson_id
JOIN Students ON student = stud_id
WHERE	group_name='Java_326'
--AND		Schedule.discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
GROUP BY group_name
