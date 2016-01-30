SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNotificationTypeAction]
	@NotificationTypeActionID int
AS
BEGIN
	SELECT [NotificationTypeActionID], [NotificationTypeID], [NameResourceKey], [DescriptionResourceKey], [ConfirmResourceKey], [Order], [APICall], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]
	FROM dbo.[CoreMessaging_NotificationTypeActions]
	WHERE [NotificationTypeActionID] = @NotificationTypeActionID
END
GO
