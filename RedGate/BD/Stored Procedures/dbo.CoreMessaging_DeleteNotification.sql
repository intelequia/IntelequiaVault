SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteNotification]
	@NotificationID int
AS
BEGIN
	DELETE
	FROM dbo.[CoreMessaging_Messages]
	WHERE [MessageID] = @NotificationID AND [NotificationTypeID] IS NOT NULL
END
GO
