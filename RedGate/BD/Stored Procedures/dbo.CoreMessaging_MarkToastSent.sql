SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_MarkToastSent]	
    @MessageId int,
	@UserId INT
AS
BEGIN	
    UPDATE dbo.CoreMessaging_MessageRecipients
    SET Sendtoast = 0,
    [LastModifiedOnDate] = GETDATE()
    WHERE MessageId = @MessageId
	AND UserId = @UserId
END
GO
