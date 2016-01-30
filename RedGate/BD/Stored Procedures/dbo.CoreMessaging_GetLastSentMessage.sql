SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetLastSentMessage]
	@UserID int,
	@PortalID INT
AS
BEGIN
	SELECT TOP 1 *	
	FROM dbo.[CoreMessaging_Messages]
	WHERE SenderUserID = @UserID	
	AND PortalID=@PortalID
	AND NotificationTypeID IS NULL
	ORDER BY MessageID DESC
END
GO
