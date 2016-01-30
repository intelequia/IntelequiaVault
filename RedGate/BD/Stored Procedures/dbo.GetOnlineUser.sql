SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetOnlineUser]
	@UserID int
AS

	SELECT
		U.UserID,
		U.UserName
	FROM dbo.Users U
	WHERE U.UserID = @UserID
		AND EXISTS (
			select 1 from dbo.UsersOnline UO where UO.UserID = U.UserID
		)
GO
