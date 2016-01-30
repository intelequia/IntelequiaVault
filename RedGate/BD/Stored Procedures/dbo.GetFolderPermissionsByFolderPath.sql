SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderPermissionsByFolderPath]
	
	@PortalID int,
	@FolderPath nvarchar(300), 
	@PermissionID int

AS
SELECT *
FROM dbo.vw_FolderPermissions

WHERE	((FolderPath = @FolderPath 
				AND ((PortalID = @PortalID) OR (PortalID IS NULL AND @PortalID IS NULL)))
			OR (FolderPath IS NULL AND PermissionCode = 'SYSTEM_FOLDER'))
	AND	(PermissionID = @PermissionID OR @PermissionID = -1)
GO
