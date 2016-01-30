SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabPermission]

	@TabPermissionID int

AS
SELECT *
FROM dbo.vw_TabPermissions
WHERE TabPermissionID = @TabPermissionID
GO
