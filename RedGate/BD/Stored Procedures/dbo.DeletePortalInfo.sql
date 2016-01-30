SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalInfo]
	@PortalID int

AS
	/* Delete all the Portal Modules */
	DELETE
	FROM dbo.Modules
	WHERE PortalId = @PortalID

	/* Delete all the Portal Skins */
	DELETE
	FROM dbo.Packages
	WHERE  PortalId = @PortalID

	/* Delete Portal */
	DELETE
	FROM dbo.Portals
	WHERE  PortalId = @PortalID
GO
