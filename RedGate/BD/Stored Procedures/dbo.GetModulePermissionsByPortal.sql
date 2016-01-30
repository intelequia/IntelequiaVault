SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModulePermissionsByPortal]
    @PortalId Int -- Not Null!
AS
    SELECT *
    FROM dbo.[vw_ModulePermissions]
    WHERE PortalID = @PortalID
GO
