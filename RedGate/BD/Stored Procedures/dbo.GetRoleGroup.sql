SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoleGroup]
	@PortalID		int,
	@RoleGroupId    int
AS
	SELECT *
		FROM dbo.RoleGroups
		WHERE  (RoleGroupId = @RoleGroupId OR RoleGroupId IS NULL AND @RoleGroupId IS NULL)
			AND    PortalId = @PortalID
GO
