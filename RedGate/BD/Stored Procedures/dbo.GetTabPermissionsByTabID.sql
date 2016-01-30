SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabPermissionsByTabID]
	@TabID int, 
	@PermissionID int
AS

	SELECT  *
	FROM    dbo.vw_TabPermissions
	WHERE   (TabID = @TabID OR (TabID IS NULL AND PermissionCode = 'SYSTEM_TAB'))
		AND	(PermissionID = @PermissionID OR @PermissionID = -1)
GO
