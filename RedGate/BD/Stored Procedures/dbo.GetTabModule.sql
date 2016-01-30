SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModule]
    @TabModuleID	int
AS
    SELECT *
	FROM dbo.vw_TabModules        
    WHERE  TabModuleID = @TabModuleID
GO
