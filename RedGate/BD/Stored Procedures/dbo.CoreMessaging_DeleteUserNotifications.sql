SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteUserNotifications]
	@UserId INT,
	@PortalId INT
AS
BEGIN
	DELETE FROM dbo.CoreMessaging_Messages
	WHERE PortalId = @PortalId
	  AND NotificationTypeID IS NOT NULL
	  AND MessageID IN (SELECT MessageID FROM dbo.CoreMessaging_MessageRecipients WHERE UserID = @UserId)

	SELECT @@ROWCOUNT
END
GO
