SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDesktopModulePermission]
	@DesktopModulePermissionID int
AS
    DELETE FROM dbo.DesktopModulePermission
    WHERE DesktopModulePermissionID = @DesktopModulePermissionID
GO
