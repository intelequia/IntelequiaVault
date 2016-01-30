SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteModulePermissionsByModuleID]
	@ModuleID int,
	@PortalID int
AS
	DELETE FROM dbo.ModulePermission
		WHERE ModuleID = @ModuleID
			AND PortalID = @PortalID
GO
