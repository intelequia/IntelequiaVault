SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDesktopModulePermissionsByPortalDesktopModuleID]
	@PortalDesktopModuleID int
AS
    SELECT *
    FROM dbo.vw_DesktopModulePermissions
	WHERE   PortalDesktopModuleID = @PortalDesktopModuleID
GO
