SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModulePermission]
	
	@ModulePermissionID int

AS
SELECT *
FROM dbo.vw_ModulePermissions
WHERE ModulePermissionID = @ModulePermissionID
GO
