SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabModuleVersionByModule]
    @ModuleID	int
AS
    UPDATE dbo.TabModules
        SET    VersionGuid = NEWID()
    WHERE  ModuleID = @ModuleID
GO
