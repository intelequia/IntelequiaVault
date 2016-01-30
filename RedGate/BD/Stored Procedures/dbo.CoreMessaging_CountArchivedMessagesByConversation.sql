SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountArchivedMessagesByConversation]
	@ConversationID int
AS
BEGIN
	SELECT COUNT(*) AS TotalArchivedThreads
	FROM dbo.[CoreMessaging_MessageRecipients]
	WHERE MessageID IN (SELECT MessageID FROM dbo.[CoreMessaging_Messages] WHERE ConversationID = @ConversationID)
	AND [Archived] = 1
END
GO
