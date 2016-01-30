SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePermission]
	@PermissionID int
AS

DELETE FROM dbo.Permission
WHERE
	[PermissionID] = @PermissionID
GO
