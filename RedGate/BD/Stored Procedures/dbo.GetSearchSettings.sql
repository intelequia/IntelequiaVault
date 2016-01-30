SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSearchSettings]

	@ModuleID	int

AS
	SELECT     	settings.SettingName, 
				settings.SettingValue
	FROM	dbo.Modules m 
		INNER JOIN dbo.Portals p ON m.PortalID = p.PortalID 
		INNER JOIN dbo.PortalSettings settings ON p.PortalID = settings.PortalID
	WHERE   m.ModuleID = @ModuleID
		AND settings.SettingName LIKE 'Search%'
GO
