SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_UpdateMessage] 
   @MessageID bigint,
   @ToUserID int,
   @ToRoleID int,
   @Status int,
   @Subject nvarchar(max),
   @Body nvarchar(max),
   @Date datetime,
   @ReplyTo bigint,
   @AllowReply bit,
   @SkipPortal bit
AS
	UPDATE dbo.Messaging_Messages
	SET ToUserID=@ToUserID, 
		ToRoleID=@ToRoleID, 
		Status=@Status, 
		Subject=@Subject, 
		Body=@Body, 
		Date= @Date,
		ReplyTo= @ReplyTo,
		AllowReply = @AllowReply,
		SkipPortal = @SkipPortal
	WHERE MessageID=@MessageID
GO
