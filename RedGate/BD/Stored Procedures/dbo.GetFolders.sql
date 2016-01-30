SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolders]
	@PortalID int -- Null|-1: Host Portal
AS
BEGIN
	SELECT *
	FROM dbo.Folders
	WHERE IsNull(PortalID, -1) = IsNull(@PortalID, -1) 
	ORDER BY PortalID, FolderPath -- include portalId to use proper index
END
GO
