SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_MarkMessageAsDispatched]
	@MessageId int
AS
BEGIN
	Update Messaging_Messages set EmailSent = 1, EmailSentDate =GETDATE()   where MessageID =@MessageId
END
GO
