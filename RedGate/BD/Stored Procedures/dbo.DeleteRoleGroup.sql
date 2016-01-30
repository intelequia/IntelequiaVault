SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteRoleGroup]

	@RoleGroupId      int
	
AS

DELETE  
FROM dbo.RoleGroups
WHERE  RoleGroupId = @RoleGroupId
GO
