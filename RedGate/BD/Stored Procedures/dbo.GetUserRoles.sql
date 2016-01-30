SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRoles]
	@PortalId  int,
	@UserId    int
AS
	SELECT *
		FROM dbo.vw_UserRoles
		WHERE UserID = @UserId AND PortalID = @PortalId
GO
