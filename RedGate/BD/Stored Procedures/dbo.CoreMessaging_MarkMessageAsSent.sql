SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_MarkMessageAsSent]
	@MessageId int,
	@RecipientId int
AS
BEGIN
	Update dbo.CoreMessaging_MessageRecipients set EmailSent = 1  where MessageID =@MessageId AND RecipientId=@RecipientId
END
GO
