SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModules]
	@TabId int -- not null!
AS
BEGIN
	SELECT	* 
	FROM dbo.vw_TabModules
	WHERE  TabId = @TabId
	ORDER BY TabId, PaneName, ModuleOrder -- optimized for index used
END
GO
