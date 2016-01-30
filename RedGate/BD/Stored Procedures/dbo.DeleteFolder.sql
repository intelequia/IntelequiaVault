SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFolder]	
    @PortalID int,
    @FolderPath nvarchar(300)
AS
BEGIN
    IF @PortalID is null
    BEGIN
        DELETE FROM dbo.Folders
        WHERE PortalID is null AND FolderPath = @FolderPath
    END ELSE BEGIN
        DELETE FROM dbo.Folders
        WHERE PortalID = @PortalID AND FolderPath = @FolderPath
    END
END
GO
