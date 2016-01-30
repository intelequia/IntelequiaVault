SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRole]

	@PortalID int, 
	@UserID int, 
	@RoleId int

AS
	SELECT	*
	    FROM	dbo.vw_UserRoles
	    WHERE   UserId = @UserID
		    AND  PortalId = @PortalID
		    AND  RoleId = @RoleId
GO
