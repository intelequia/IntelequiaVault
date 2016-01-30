SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFileVersion]
	@FileID			int,
    @VersionGuid	uniqueidentifier
AS
    UPDATE dbo.Files
        SET    VersionGuid = @VersionGuid
    WHERE  FileID = @FileID
GO
