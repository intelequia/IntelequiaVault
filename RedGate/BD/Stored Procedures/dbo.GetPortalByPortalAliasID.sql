SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalByPortalAliasID]

	@PortalAliasId  int

AS
SELECT P.*
FROM dbo.vw_Portals P
	INNER JOIN dbo.PortalAlias PA ON P.PortalID = PA.PortalID
WHERE PA.PortalAliasId = @PortalAliasId
GO
