SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDesktopModulePermissionsByPortalDesktopModuleID]
	@PortalDesktopModuleID int
AS
    DELETE FROM dbo.DesktopModulePermission
    WHERE PortalDesktopModuleID = @PortalDesktopModuleID
GO
