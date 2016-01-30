SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNotificationTypeActionByName]
	@NotificationTypeID int,
	@NameResourceKey nvarchar(100)
AS
BEGIN
	SELECT [NotificationTypeActionID], [NotificationTypeID], [NameResourceKey], [DescriptionResourceKey], [ConfirmResourceKey], [Order], [APICall], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]
	FROM dbo.[CoreMessaging_NotificationTypeActions]
	WHERE [NotificationTypeID] = @NotificationTypeID AND [NameResourceKey] LIKE @NameResourceKey
END
GO
