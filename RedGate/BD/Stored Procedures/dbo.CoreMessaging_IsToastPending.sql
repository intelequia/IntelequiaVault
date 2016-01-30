SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_IsToastPending]	
    @NotificationId int
AS
BEGIN
    SELECT Sendtoast 
    FROM dbo.[CoreMessaging_MessageRecipients]
    WHERE MessageId = @NotificationId
END
GO
