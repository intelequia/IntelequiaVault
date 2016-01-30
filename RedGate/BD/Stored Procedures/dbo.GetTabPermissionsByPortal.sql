SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetTabPermissionsByPortal]
	
	@PortalID int

AS

	IF @portalid is not null
		BEGIN 
			SELECT *
				FROM dbo.vw_TabPermissions
				WHERE PortalID = @PortalID
		END
	ELSE
		BEGIN
			SELECT *
				FROM dbo.vw_TabPermissions
				WHERE PortalID IS NULL 
		END
GO
