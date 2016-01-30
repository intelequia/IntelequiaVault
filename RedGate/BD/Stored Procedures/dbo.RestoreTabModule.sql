SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RestoreTabModule]
	@TabId      int,
	@ModuleId   int
AS
	UPDATE dbo.TabModules
		SET IsDeleted = 0,
			VersionGuid = newId()
	WHERE  TabId = @TabId
		AND    ModuleId = @ModuleId
GO
