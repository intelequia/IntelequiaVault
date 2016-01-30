SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteMessageRecipientByMessageAndUser]
    @MessageID int,
    @UserID int
AS
BEGIN
	DELETE
	FROM dbo.[CoreMessaging_MessageRecipients]
	WHERE [MessageID] = @MessageID AND [UserID] = @UserID
END
GO
