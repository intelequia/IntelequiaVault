SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateEventLogConfig]
	@ID int,
	@LogTypeKey nvarchar(35),
	@LogTypePortalID int,
	@LoggingIsActive bit,
	@KeepMostRecent int,
	@EmailNotificationIsActive bit,
	@NotificationThreshold int,
	@NotificationThresholdTime int,
	@NotificationThresholdTimeType int,
	@MailFromAddress nvarchar(50),
	@MailToAddress nvarchar(50)
AS
UPDATE dbo.EventLogConfig
SET 	LogTypeKey = @LogTypeKey,
	LogTypePortalID = @LogTypePortalID,
	LoggingIsActive = @LoggingIsActive,
	KeepMostRecent = @KeepMostRecent,
	EmailNotificationIsActive = @EmailNotificationIsActive,
	NotificationThreshold = @NotificationThreshold,
	NotificationThresholdTime = @NotificationThresholdTime,
	NotificationThresholdTimeType = @NotificationThresholdTimeType,
	MailFromAddress = @MailFromAddress,
	MailToAddress = @MailToAddress
WHERE	ID = @ID
GO
