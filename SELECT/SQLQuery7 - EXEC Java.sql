--USE PD_212
--DELETE FROM Schedule WHERE [group] = (SELECT group_id FROM Groups WHERE group_name='Java_326')
--DELETE FROM Grades 
--DELETE FROM Attendance 

--EXEC mysp_addToSchedule 'Java_326', '%Java', 1, '2023-06-29','18:30'
--EXEC my_home_sp_addAttendance 'PD_212', '%MS SQL%'
EXEC mysp_SelectFromSchedule 