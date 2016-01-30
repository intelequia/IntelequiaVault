SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetExtensionUrlProviders] 
	@PortalID	int 
AS
	SELECT 
		p.*, 
		pc.PortalID
	FROM  dbo.ExtensionUrlProviderConfiguration pc 
		RIGHT OUTER JOIN dbo.ExtensionUrlProviders p 
			ON pc.ExtensionUrlProviderID = p.ExtensionUrlProviderID
	WHERE pc.PortalID = @PortalID OR pc.PortalID IS Null

	SELECT ExtensionUrlProviderID, 
			PortalID, 
			SettingName, 
			SettingValue
	FROM dbo.ExtensionUrlProviderSetting
	WHERE PortalID = PortalID

	SELECT DISTINCT 
			P.ExtensionUrlProviderID,
			TM.TabID
		FROM dbo.DesktopModules DM
			INNER JOIN dbo.ModuleDefinitions MD ON DM.DesktopModuleID = MD.DesktopModuleID 
			INNER JOIN dbo.Modules M ON MD.ModuleDefID = M.ModuleDefID 
			INNER JOIN dbo.TabModules TM ON M.ModuleID = TM.ModuleID 
			INNER JOIN dbo.vw_ExtensionUrlProviders P ON DM.DesktopModuleID = P.DesktopModuleId
		WHERE     (P.PortalID = @PortalID) OR (P.PortalID IS NULL)
		  
		UNION
			SELECT  
				P.ExtensionUrlProviderID,
				PT.TabId
			FROM    dbo.ExtensionUrlProviderTab PT
				INNER JOIN dbo.ExtensionUrlProviders P ON P.ExtensionUrlProviderID = PT.ExtensionUrlProviderID
			WHERE   (PT.IsActive = 1)
GO
