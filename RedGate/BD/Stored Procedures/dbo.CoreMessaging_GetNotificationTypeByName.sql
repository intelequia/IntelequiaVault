SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNotificationTypeByName]
	@Name nvarchar(100)
AS
BEGIN
	SELECT [NotificationTypeID], [Name], [Description], [TTL], [DesktopModuleId], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate], [IsTask]
	FROM dbo.[CoreMessaging_NotificationTypes]
	WHERE [Name] LIKE @Name
END
GO
