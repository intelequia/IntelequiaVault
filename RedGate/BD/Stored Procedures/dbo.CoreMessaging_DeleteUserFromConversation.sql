SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteUserFromConversation]
	@ConversationID INT,
    @UserID INT
AS
    --Remove the User from recipients list
	DELETE FROM dbo.[CoreMessaging_MessageRecipients]
		WHERE [UserID] = @UserID
		AND MessageID IN (SELECT MessageID FROM dbo.[CoreMessaging_Messages] WHERE ConversationID = @ConversationID)
    
    --Remove Messages which has no recipient
    DELETE FROM dbo.[CoreMessaging_Messages]
        FROM dbo.[CoreMessaging_Messages] m
        LEFT JOIN dbo.[CoreMessaging_MessageRecipients] mr on MR.MessageID = m.MessageID
        WHERE ConversationID = @ConversationID AND mr.MessageID IS NULL
GO
