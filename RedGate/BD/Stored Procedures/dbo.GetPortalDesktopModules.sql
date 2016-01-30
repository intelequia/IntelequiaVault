SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalDesktopModules]
	@PortalId int,
	@DesktopModuleId int

AS
	SELECT PortalDesktopModules.*,
		   PortalName,
		   FriendlyName
	FROM   PortalDesktopModules
		INNER JOIN vw_Portals ON PortalDesktopModules.PortalId = vw_Portals.PortalId
		INNER JOIN DesktopModules ON PortalDesktopModules.DesktopModuleId = DesktopModules.DesktopModuleId
	WHERE  ((PortalDesktopModules.PortalId = @PortalId) OR @PortalId is null)
		AND    ((PortalDesktopModules.DesktopModuleId = @DesktopModuleId) OR @DesktopModuleId is null)
	ORDER BY PortalDesktopModules.PortalId, PortalDesktopModules.DesktopModuleId
GO
