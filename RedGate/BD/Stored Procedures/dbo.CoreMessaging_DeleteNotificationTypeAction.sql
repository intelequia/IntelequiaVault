SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteNotificationTypeAction]
	@NotificationTypeActionID int
AS
BEGIN
	DELETE 
	FROM dbo.[CoreMessaging_NotificationTypeActions]
	WHERE [NotificationTypeActionID] = @NotificationTypeActionID
END
GO
