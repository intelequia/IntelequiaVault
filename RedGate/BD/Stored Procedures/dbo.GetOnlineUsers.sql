SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetOnlineUsers]
	@PortalID int
AS
	SELECT *
		FROM dbo.UsersOnline UO
			INNER JOIN dbo.vw_Users U ON UO.UserID = U.UserID 
			INNER JOIN dbo.UserPortals UP ON U.UserID = UP.UserId
		WHERE  UP.PortalID = @PortalID AND U.PortalID = @PortalID
GO
