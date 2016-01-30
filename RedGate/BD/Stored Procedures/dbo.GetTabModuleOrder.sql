SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModuleOrder]
	@TabId    int, 			-- Not Null
	@PaneName nvarchar(50)  -- Not Null
AS
BEGIN
	SELECT *
	FROM TabModules 
	WHERE TabId    = @TabId 
	  AND PaneName = @PaneName
	ORDER BY TabId, PaneName, ModuleOrder -- optimized for index used
END
GO
