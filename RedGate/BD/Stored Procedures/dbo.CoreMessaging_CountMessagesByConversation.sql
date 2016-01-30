SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountMessagesByConversation]
	@ConversationID int
AS
BEGIN
	SELECT COUNT(*) AS TotalRecords
	FROM dbo.CoreMessaging_Messages
	WHERE (ConversationID = @ConversationID)
END
GO
