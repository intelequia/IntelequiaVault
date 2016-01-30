SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteModulePermission]
	@ModulePermissionID int
AS

DELETE FROM dbo.ModulePermission
WHERE
	[ModulePermissionID] = @ModulePermissionID
GO
