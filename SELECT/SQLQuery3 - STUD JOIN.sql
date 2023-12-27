SELECT
	Students.stud_id AS 'ID',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS 'Преподаватель',
	Groups.group_name AS 'Группа'
	--JOIN - сопроставление таблиц по ключам
	-- RIGHT JOIN - выделяет даже если нет ссылок, делает таблицу справа главной
FROM Students JOIN Groups ON [group] = group_id
WHERE group_name = 'PD_212'