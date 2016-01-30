SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFolderPermission]
	@FolderPermissionID int
AS

DELETE FROM dbo.FolderPermission
WHERE
	[FolderPermissionID] = @FolderPermissionID
GO
