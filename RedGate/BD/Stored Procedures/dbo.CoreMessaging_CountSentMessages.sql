SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountSentMessages]
	@UserID int,
	@PortalID int
AS
BEGIN
	SELECT COUNT(MessageID) AS TotalRecords
	FROM dbo.[CoreMessaging_Messages]
	WHERE SenderUserID = @UserID
	AND NotificationTypeID IS NULL AND PortalID = @PortalID
END
GO
