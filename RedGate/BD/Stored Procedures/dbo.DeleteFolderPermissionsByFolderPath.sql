SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFolderPermissionsByFolderPath]
    @PortalId   Int,            -- Null for Host menu tabs
    @FolderPath nVarChar(300)   -- must be a valid path
AS
BEGIN
    DELETE FROM dbo.[FolderPermission]
    WHERE FolderID IN (SELECT FolderID FROM dbo.[Folders]
                                       WHERE FolderPath = @FolderPath AND (IsNull(PortalID, -1) = IsNull(@PortalId, -1)))
END
GO
