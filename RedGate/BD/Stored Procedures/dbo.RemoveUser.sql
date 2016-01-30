SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveUser]
	@UserID		int,
	@PortalID   int
AS
	IF @PortalID IS NULL
		BEGIN
			-- Delete SuperUser
			DELETE FROM dbo.Users
				WHERE  UserId = @UserID
		END
	ELSE
		BEGIN
			-- Remove User from Portal
			DELETE FROM dbo.UserPortals
				WHERE  UserId = @UserID
                 AND PortalId = @PortalID
			IF NOT EXISTS (SELECT 1 FROM dbo.UserPortals WHERE  UserId = @UserID)
				-- Delete User (but not if SuperUser)
				BEGIN
					DELETE FROM dbo.Users
						WHERE  UserId = @UserID
							AND IsSuperUser = 0
					DELETE FROM dbo.UserRoles
						WHERE  UserID = @UserID
				END
			ELSE
				BEGIN
					DELETE ur FROM dbo.UserRoles ur
						INNER JOIN dbo.Roles r ON r.RoleID = ur.RoleID
						WHERE  UserID = @UserID AND r.PortalID = @PortalID
				END
		END
GO
