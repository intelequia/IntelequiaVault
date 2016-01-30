SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetSearchResultModules]

@PortalID int

AS

SELECT     
		TM.TabID, 
		T.TabName  AS SearchTabName
FROM	dbo.Modules M
INNER JOIN	dbo.ModuleDefinitions MD ON MD.ModuleDefID = M.ModuleDefID 
INNER JOIN	dbo.TabModules TM ON TM.ModuleID = M.ModuleID 
INNER JOIN	dbo.Tabs T ON T.TabID = TM.TabID
WHERE	MD.FriendlyName = N'Search Results'
	AND T.PortalID = @PortalID
	AND T.IsDeleted = 0
GO
