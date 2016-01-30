SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteMessageRecipient]
    @RecipientID int
AS
	DELETE FROM dbo.CoreMessaging_MessageRecipients
	WHERE  [RecipientID] = @RecipientID
GO
