SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountNewThreads]
	@UserID int,
	@PortalID INT
AS
BEGIN
	SELECT COUNT(*) AS TotalNewThreads
	FROM dbo.[CoreMessaging_MessageRecipients] MR
	JOIN dbo.[CoreMessaging_Messages] M ON MR.MessageID = M.MessageID
	WHERE MR.UserID = @UserID
	AND MR.[Read] = 0
	AND M.PortalID=@PortalID
	AND M.NotificationTypeID IS NULL
END
GO
