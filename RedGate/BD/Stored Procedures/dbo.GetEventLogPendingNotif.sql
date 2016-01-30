SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventLogPendingNotif]
	@LogConfigID int
AS
SELECT *
FROM dbo.vw_EventLog
WHERE LogNotificationPending = 1
AND LogConfigID = @LogConfigID
GO
