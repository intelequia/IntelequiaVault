SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharedModulesWithPortal]
	@Portald int
AS
	SELECT * FROM dbo.vw_TabModules tb		
	WHERE tb.PortalID != tb.OwnerPortalID	
	AND tb.PortalID = @Portald
GO
