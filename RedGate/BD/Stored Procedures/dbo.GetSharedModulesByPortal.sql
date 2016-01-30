SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharedModulesByPortal]
	@Portald int
AS
	SELECT * FROM dbo.vw_TabModules tb		
	WHERE tb.PortalID != tb.OwnerPortalID	
	AND tb.OwnerPortalID = @Portald
GO
