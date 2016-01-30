SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddRoleGroup] 
	@PortalID         int,
	@RoleGroupName    nvarchar(50),
	@Description      nvarchar(1000),
	@CreatedByUserID  int
AS

	INSERT INTO dbo.RoleGroups (
	  PortalId,
	  RoleGroupName,
	  Description,
	  CreatedByUserID,
	  CreatedOnDate,
	  LastModifiedByUserID,
	  LastModifiedOnDate
	)
	VALUES (
	  @PortalID,
	  @RoleGroupName,
	  @Description,
	  @CreatedByUserID,
	  getdate(),
	  @CreatedByUserID,
	  getdate()
	)

SELECT SCOPE_IDENTITY()
GO
