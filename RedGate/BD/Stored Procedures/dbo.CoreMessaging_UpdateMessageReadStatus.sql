SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_UpdateMessageReadStatus]
	@ConversationID int,
	@UserID          int,
	@Read			 bit
AS
BEGIN
UPDATE dbo.[CoreMessaging_MessageRecipients] SET [Read]=@Read 
WHERE UserID = @UserID
AND MessageID IN (SELECT MessageID FROM dbo.[CoreMessaging_Messages] WHERE ConversationID=@ConversationID)
END
GO
