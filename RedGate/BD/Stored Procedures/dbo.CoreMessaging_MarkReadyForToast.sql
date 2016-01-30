SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_MarkReadyForToast]	
    @MessageId int,
    @UserId int
AS
BEGIN	
    UPDATE dbo.[CoreMessaging_MessageRecipients]
    SET Sendtoast = 1,
    [LastModifiedOnDate] = GETDATE()
    WHERE MessageId = @MessageId
    AND UserId = @UserId
END
GO
