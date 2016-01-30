SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[DeleteTabPermissionsByUserID]
	@PortalID int,
	@UserID int
AS
	DELETE FROM dbo.TabPermission
		FROM dbo.TabPermission TP
			INNER JOIN dbo.Tabs AS T ON TP.TabID = T.TabID
		WHERE T.PortalID = @PortalID
		AND TP.UserID = @UserID
GO
