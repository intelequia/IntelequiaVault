SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFolderVersion]
	@FolderID		int,
    @VersionGuid	uniqueidentifier
AS
    UPDATE dbo.Folders
        SET    VersionGuid = @VersionGuid
    WHERE  FolderID = @FolderID
GO
