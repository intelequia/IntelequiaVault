SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPermission]
	@ModuleDefID		int,
	@PermissionCode		varchar(50),
	@PermissionKey		varchar(50),
	@PermissionName		varchar(50),
	@CreatedByUserID	int
AS

INSERT INTO dbo.Permission (
	[ModuleDefID],
	[PermissionCode],
	[PermissionKey],
	[PermissionName],
	[CreatedByUserID],
	[CreatedOnDate],
	[LastModifiedByUserID],
	[LastModifiedOnDate]
) VALUES (
	@ModuleDefID,
	@PermissionCode,
	@PermissionKey,
	@PermissionName,
	@CreatedByUserID,
	getdate(),
	@CreatedByUserID,
	getdate()
)

select SCOPE_IDENTITY()
GO
