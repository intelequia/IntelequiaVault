SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoleGroups]
	@PortalID		int
AS
	SELECT *
		FROM dbo.RoleGroups
		WHERE  PortalId = @PortalID
		ORDER BY RoleGroupName
GO
