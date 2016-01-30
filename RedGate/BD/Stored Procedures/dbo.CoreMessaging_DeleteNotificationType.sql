SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteNotificationType]
	@NotificationTypeID int
AS
BEGIN
	-- First delete related data
	DELETE
	FROM dbo.[CoreMessaging_Messages]
	WHERE [NotificationTypeID] = @NotificationTypeID
	
	DELETE
	FROM dbo.[CoreMessaging_NotificationTypeActions]
	WHERE [NotificationTypeID] = @NotificationTypeID

	-- Finally delete the Notification type
	DELETE
	FROM dbo.[CoreMessaging_NotificationTypes]
	WHERE [NotificationTypeID] = @NotificationTypeID
END
GO
