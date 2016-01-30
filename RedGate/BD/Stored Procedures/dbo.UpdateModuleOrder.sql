SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModuleOrder]
	@TabId              int,
	@ModuleId           int,
	@ModuleOrder        int,
	@PaneName           nvarchar(50)
AS
	UPDATE dbo.TabModules
		SET	ModuleOrder = @ModuleOrder,
			PaneName = @PaneName,
			VersionGuid = newId()
	WHERE TabId = @TabId
		AND ModuleId = @ModuleId
GO
