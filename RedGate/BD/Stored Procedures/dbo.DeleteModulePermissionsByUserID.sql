SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[DeleteModulePermissionsByUserID]
	@PortalID int,
	@UserID int
AS
	DELETE FROM dbo.ModulePermission
		FROM dbo.ModulePermission MP
			INNER JOIN dbo.Modules AS M ON MP.ModuleID = M.ModuleID
		WHERE M.PortalID = @PortalID
		AND MP.UserID = @UserID
GO
