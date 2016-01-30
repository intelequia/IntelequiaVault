SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderPermissionsByPortal]
    @PortalId Int   -- Null|-1 for Host menu tabs
AS
    SELECT *
    FROM dbo.[vw_FolderPermissions]
    WHERE IsNull(PortalID, -1) = IsNull(@PortalId, -1)
GO
