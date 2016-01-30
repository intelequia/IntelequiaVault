SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetInstalledModules]
AS
	SELECT		
		DesktopModuleID, 
		ModuleName,
		FriendlyName,
		Version,
		(SELECT     COUNT(*) AS Instances
			FROM          dbo.DesktopModules 
				INNER JOIN dbo.ModuleDefinitions ON dbo.DesktopModules.DesktopModuleID = dbo.ModuleDefinitions.DesktopModuleID 
				INNER JOIN dbo.Modules ON dbo.ModuleDefinitions.ModuleDefID = dbo.Modules.ModuleDefID
			WHERE      (dbo.DesktopModules.DesktopModuleID = DM.DesktopModuleID)) AS Instances
	FROM dbo.DesktopModules AS DM
	WHERE (IsAdmin = 0)
	ORDER BY [FriendlyName] ASC
GO
