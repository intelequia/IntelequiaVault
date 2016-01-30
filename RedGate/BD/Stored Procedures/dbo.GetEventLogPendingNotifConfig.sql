SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventLogPendingNotifConfig]
AS

SELECT 	COUNT(*) as PendingNotifs,
	elc.ID,
	elc.LogTypeKey, 
	elc.LogTypePortalID, 
	elc.LoggingIsActive,
	elc.KeepMostRecent,
	elc.EmailNotificationIsActive,
	elc.NotificationThreshold,
	elc.NotificationThresholdTime,
	elc.NotificationThresholdTimeType,
	elc.MailToAddress, 
	elc.MailFromAddress
FROM dbo.EventLogConfig elc
INNER JOIN dbo.EventLog
ON dbo.EventLog.LogConfigID = elc.ID
WHERE dbo.EventLog.LogNotificationPending = 1
GROUP BY elc.ID,
	elc.LogTypeKey, 
	elc.LogTypePortalID, 
	elc.LoggingIsActive,
	elc.KeepMostRecent,
	elc.EmailNotificationIsActive,
	elc.NotificationThreshold,
	elc.NotificationThresholdTime,
	elc.NotificationThresholdTimeType,
	elc.MailToAddress, 
	elc.MailFromAddress
GO
