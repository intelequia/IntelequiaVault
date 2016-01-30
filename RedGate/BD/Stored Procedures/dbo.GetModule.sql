SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModule]

	@ModuleId int,
	@TabId    int
	
AS
SELECT	* 
FROM dbo.vw_Modules
WHERE   ModuleId = @ModuleId
AND     (TabId = @TabId or @TabId is null)
GO
