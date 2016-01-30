SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_GetInboxCount] 
	@PortalID int,
	@UserID int
AS

	SELECT COUNT (*)[Body]
	FROM dbo.Messaging_Messages
	WHERE (ToUserID= @UserID AND Status in (1,2) AND SkipPortal = '0') 
		OR (FromUserID = @UserID AND Status = 0)
GO
