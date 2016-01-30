SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_GetNewMessageCount] 
	@PortalID int,
	@UserID int
AS
	SELECT count(*) FROM Messaging_Messages WHERE ToUserID = @UserID AND Status = 1
GO
