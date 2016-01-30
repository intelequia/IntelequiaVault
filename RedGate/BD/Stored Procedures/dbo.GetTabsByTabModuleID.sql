SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabsByTabModuleID]
	@TabModuleID Int -- NOT Null
AS
	BEGIN
		SELECT * FROM dbo.[vw_Tabs] T
		WHERE IsDeleted = 0
		  AND TabID IN (SELECT TabID FROM dbo.[TabModules]
						WHERE TabModuleID = @TabModuleID AND IsDeleted = 0)
		ORDER BY PortalId, Level, ParentID, TabOrder -- PortalId added for query optimization
	END
GO
