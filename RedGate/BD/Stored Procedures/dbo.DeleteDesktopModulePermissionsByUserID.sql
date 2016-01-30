SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDesktopModulePermissionsByUserID]
    @UserId   INT,  -- required, not null!
	@PortalId INT -- Null affects all sites
AS
    DELETE FROM dbo.[DesktopModulePermission]
    WHERE UserID = @UserId
     AND (PortalDesktopModuleID IN (SELECT PortalDesktopModuleID 
									FROM dbo.[PortalDesktopModules] 
									WHERE PortalID = @PortalId) OR IsNull(@PortalId, -1) = -1)
GO
