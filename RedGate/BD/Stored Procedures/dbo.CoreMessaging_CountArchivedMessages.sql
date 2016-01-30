SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountArchivedMessages]
	@UserID int,
	@PortalID int
AS
BEGIN
	SELECT COUNT(DISTINCT M.MessageID) AS TotalRecords
	FROM dbo.[CoreMessaging_Messages] M
	JOIN dbo.[CoreMessaging_MessageRecipients] MR ON M.MessageID = MR.MessageID
	WHERE Archived = 1
	AND NotificationTypeID IS NULL AND PortalID = @PortalID AND UserID = @UserID
END
GO
