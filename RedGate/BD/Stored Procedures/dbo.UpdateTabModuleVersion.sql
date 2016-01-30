SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabModuleVersion]
    @TabModuleID	int,
    @VersionGuid	uniqueidentifier
AS
    UPDATE dbo.TabModules
        SET    VersionGuid = @VersionGuid
    WHERE  TabModuleID = @TabModuleID
GO
