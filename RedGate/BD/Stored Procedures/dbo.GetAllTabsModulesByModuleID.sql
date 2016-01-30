SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllTabsModulesByModuleID]
    @ModuleID	int
AS
	SELECT	* 
	FROM dbo.vw_Modules
	WHERE  ModuleID = @ModuleID
GO
