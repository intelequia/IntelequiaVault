SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountNotifications]
	@UserID int,
	@PortalID INT
AS
BEGIN
	-- Return total notifications for user
	SELECT COUNT(*) AS TotalNotifications
	FROM dbo.[CoreMessaging_MessageRecipients] MR
	JOIN dbo.[CoreMessaging_Messages] M ON MR.MessageID = M.MessageID
	WHERE M.NotificationTypeId IS NOT NULL
	AND M.PortalID=@PortalID
	AND MR.UserID = @UserID
	AND (M.ExpirationDate IS NULL OR (M.ExpirationDate IS NOT NULL AND M.ExpirationDate > GETDATE())) -- Do not return expired notifications
END
GO
