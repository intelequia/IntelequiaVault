SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFolderPermissionsByUserID]
    @PortalId Int,  -- Null|-1 for Host menu tabs
    @UserId   Int   -- Not Null
AS
    DELETE FROM dbo.[FolderPermission]
    WHERE UserID = @UserId
     AND FolderID IN (SELECT FolderID FROM dbo.[Folders] 
	                  WHERE (PortalID = @PortalId Or IsNull(@PortalId, -1) = IsNull(PortalID, -1)))
GO
