SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetMessage]
    @MessageID INT
AS 
	SELECT [MessageID], [PortalId], [NotificationTypeID], [To], [From], [Subject], [Body], [ConversationID], [ReplyAllAllowed], [SenderUserID], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate] 
	FROM   dbo.[CoreMessaging_Messages] 
	WHERE  [MessageID] = @MessageID
GO
