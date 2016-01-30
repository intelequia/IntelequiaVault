SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountTotalConversations]
	@UserID int,
	@PortalID int
AS
BEGIN
	SELECT COUNT(DISTINCT M.ConversationID) AS TotalConversations
	FROM dbo.[CoreMessaging_Messages] M
	JOIN dbo.[CoreMessaging_MessageRecipients] MR ON M.MessageID = MR.MessageID
	WHERE NotificationTypeID IS NULL AND PortalID = @PortalID AND Archived = 0 AND UserID = @UserID
END
GO
