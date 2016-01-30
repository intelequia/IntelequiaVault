SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoleGroupByName]
	@PortalID		int,
	@RoleGroupName	nvarchar(50)
AS
	SELECT *
		FROM dbo.RoleGroups
		WHERE  PortalId = @PortalID 
			AND RoleGroupName = @RoleGroupName
GO
