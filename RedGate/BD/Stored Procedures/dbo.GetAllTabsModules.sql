SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetAllTabsModules]
	@PortalID int,
	@AllTabs bit
AS
	SELECT	* 
	FROM dbo.vw_Modules M
	WHERE  M.PortalID = @PortalID 
		AND M.IsDeleted = 0
		AND M.AllTabs = @AllTabs
		AND M.TabModuleID =(SELECT min(TabModuleID) 
			FROM dbo.TabModules
			WHERE ModuleID = M.ModuleID)
	ORDER BY M.ModuleId
GO
