SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_MarkMessageAsDispatched]
	@MessageId int,
	@RecipientId int
AS
BEGIN
	Update dbo.CoreMessaging_MessageRecipients set EmailSent = 1, EmailSentDate =GETDATE()   where MessageID =@MessageId AND RecipientId=@RecipientId
END
GO
