SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateRoleGroup] 
	@RoleGroupId		int,
	@RoleGroupName		nvarchar(50),
	@Description		nvarchar(1000),
	@LastModifiedUserID int
AS

	UPDATE dbo.RoleGroups
	SET    RoleGroupName		= @RoleGroupName,
		   Description			= @Description,
		   LastModifiedByUserID = @LastModifiedUserID,
		   LastModifiedOnDate		= getdate()
	WHERE  RoleGroupId = @RoleGroupId
GO
