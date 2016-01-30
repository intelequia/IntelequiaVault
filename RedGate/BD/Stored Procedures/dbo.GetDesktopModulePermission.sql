SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDesktopModulePermission]
	@DesktopModulePermissionID	int
AS
    SELECT *
    FROM dbo.vw_DesktopModulePermissions
    WHERE DesktopModulePermissionID = @DesktopModulePermissionID
GO
