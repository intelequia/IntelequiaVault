SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabVersion]
    @TabID			int,
    @VersionGuid	uniqueidentifier
AS
    UPDATE dbo.Tabs
        SET    VersionGuid = @VersionGuid
    WHERE  TabID = @TabID
GO
