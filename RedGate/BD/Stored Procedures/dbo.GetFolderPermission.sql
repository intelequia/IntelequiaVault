SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderPermission]
	
	@FolderPermissionID int

AS
SELECT *
FROM dbo.vw_FolderPermissions
WHERE FolderPermissionID = @FolderPermissionID
GO
