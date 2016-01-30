SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePermission]
	@PermissionID			int, 
	@PermissionCode			varchar(50),
	@ModuleDefID			int, 
	@PermissionKey			varchar(50), 
	@PermissionName			varchar(50),
	@LastModifiedByUserID	int
AS

UPDATE dbo.Permission SET
	[ModuleDefID] = @ModuleDefID,
	[PermissionCode] = @PermissionCode,
	[PermissionKey] = @PermissionKey,
	[PermissionName] = @PermissionName,
	[LastModifiedByUserID] = @LastModifiedByUserID,
	[LastModifiedOnDate] = getdate()
WHERE
	[PermissionID] = @PermissionID
GO
