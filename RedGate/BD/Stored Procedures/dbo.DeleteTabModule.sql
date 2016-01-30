SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTabModule]
	@TabId      int,
	@ModuleId   int,
	@SoftDelete	bit
AS
IF @SoftDelete = 1
	UPDATE dbo.TabModules
		SET	IsDeleted = 1,
			VersionGuid = newId(),
			LastModifiedOnDate=GETDATE()
	WHERE  TabId = @TabId
		AND    ModuleId = @ModuleId
ELSE
	DELETE
	FROM   dbo.TabModules 
	WHERE  TabId = @TabId
		AND    ModuleId = @ModuleId
GO
