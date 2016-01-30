SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetToasts]	
    @UserId int,
    @PortalId int
AS
BEGIN	
    SELECT DISTINCT m.*
    FROM dbo.CoreMessaging_MessageRecipients mr 
        INNER JOIN dbo.CoreMessaging_Messages m
    ON mr.MessageID = m.MessageID	
    WHERE mr.UserID = @UserID
    AND   m.PortalID = @PortalID
    AND   mr.SendToast = 1
END
GO
