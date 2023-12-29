USE [PD_212]
GO

ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Schedule]
GO

ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Schedule] FOREIGN KEY([lesson])
REFERENCES [dbo].[Schedule] ([lesson_id]) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Schedule]
GO


