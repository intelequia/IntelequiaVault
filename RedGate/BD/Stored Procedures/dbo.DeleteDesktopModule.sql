SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDesktopModule]
	@DesktopModuleId int
AS
-- delete custom permissions
DELETE FROM dbo.Permission
WHERE moduledefid in 
	(SELECT moduledefid 
	FROM dbo.ModuleDefinitions
	WHERE desktopmoduleid = @DesktopModuleId)
	
DELETE FROM dbo.DesktopModules 
WHERE DesktopModuleId = @DesktopModuleId
GO
