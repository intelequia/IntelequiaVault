SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabsByModuleID]
	@ModuleID Int -- NOT Null
AS
BEGIN
	SELECT * FROM dbo.[vw_Tabs] T
	WHERE IsDeleted = 0
	  AND TabID IN (SELECT TabID FROM dbo.[TabModules]
					WHERE ModuleID = @ModuleID AND IsDeleted = 0)
	ORDER BY PortalId, Level, ParentID, TabOrder -- PortalId added for query optimization
END
GO
