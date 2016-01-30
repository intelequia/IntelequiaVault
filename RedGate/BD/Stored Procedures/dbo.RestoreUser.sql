SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RestoreUser]
	@UserID		int,
	@PortalID   int
AS
	IF @PortalID IS NULL
		BEGIN
			UPDATE dbo.Users
				SET	IsDeleted = 0
				WHERE  UserId = @UserID
		END
	ELSE
		BEGIN
			UPDATE dbo.UserPortals
				SET IsDeleted = 0
				WHERE  UserId = @UserID
					AND PortalId = @PortalID
	END
GO
