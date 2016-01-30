SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateEventLogPendingNotif]
	@LogConfigID int
AS
UPDATE dbo.EventLog
SET LogNotificationPending = 0
WHERE LogNotificationPending = 1
AND LogConfigID = @LogConfigID
GO
