SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetMessagesBySender]
    @SenderUserID INT,
	@PortalID INT
AS
BEGIN
	SELECT [MessageID], [To], [From], [Subject], [Body], [ConversationID], [ReplyAllAllowed], [SenderUserID], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate] 
	FROM   dbo.[CoreMessaging_Messages] 
	WHERE  [SenderUserID] = @SenderUserID AND [PortalID] = @PortalID
	AND [NotificationTypeID] IS NULL
END
GO
