SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountSentConversations]
	@UserID INT,
	@PortalID INT
AS
BEGIN
	SELECT COUNT(DISTINCT ConversationID) AS TotalRecords
	    FROM dbo.[CoreMessaging_Messages] m
        INNER JOIN dbo.[CoreMessaging_MessageRecipients] mr ON mr.MessageID = m.MessageID AND mr.UserID = m.SenderUserID --make sure sender haven't delete the message.
	    WHERE SenderUserID = @UserID
	        AND NotificationTypeID IS NULL AND PortalID = @PortalID
END
GO
