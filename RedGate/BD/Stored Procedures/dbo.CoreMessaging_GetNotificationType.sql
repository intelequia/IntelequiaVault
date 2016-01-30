SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNotificationType]
	@NotificationTypeID int
AS
BEGIN
	SELECT [NotificationTypeID], [Name], [Description], [TTL], [DesktopModuleId], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate], [IsTask]
	FROM dbo.[CoreMessaging_NotificationTypes]
	WHERE [NotificationTypeID] = @NotificationTypeID
END
GO
