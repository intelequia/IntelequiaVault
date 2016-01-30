SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModuleLastContentModifiedOnDate]
    @ModuleID	int
AS
    UPDATE dbo.Modules
        SET    LastContentModifiedOnDate = GETDATE()
    WHERE  ModuleID = @ModuleID
GO
