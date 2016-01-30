SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateScheduleHistory]
@ScheduleHistoryID int,
@EndDate datetime,
@Succeeded bit,
@LogNotes ntext,
@NextStart datetime
AS
UPDATE dbo.ScheduleHistory
SET	EndDate = @EndDate,
	Succeeded = @Succeeded,
	LogNotes = @LogNotes,
	NextStart = @NextStart
WHERE ScheduleHistoryID = @ScheduleHistoryID
GO
