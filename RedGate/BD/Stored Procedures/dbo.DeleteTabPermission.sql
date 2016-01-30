SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTabPermission]
	@TabPermissionID int
AS

DELETE FROM dbo.TabPermission
WHERE
	[TabPermissionID] = @TabPermissionID
GO
