SELECT
	Students.stud_id AS 'ID',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS '�������������',
	Groups.group_name AS '������'
	--JOIN - �������������� ������ �� ������
	-- RIGHT JOIN - �������� ���� ���� ��� ������, ������ ������� ������ �������
FROM Students JOIN Groups ON [group] = group_id
WHERE group_name = 'PD_212'