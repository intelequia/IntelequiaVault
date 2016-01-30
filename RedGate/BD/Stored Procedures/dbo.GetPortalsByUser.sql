SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalsByUser]
	@userID		int 
AS

	SELECT     dbo.vw_Portals.*
FROM         dbo.UserPortals INNER JOIN
                      dbo.vw_Portals ON 
					  dbo.UserPortals.PortalId = dbo.vw_Portals.PortalID
WHERE     (dbo.UserPortals.UserId = @userID)
		AND (dbo.vw_Portals.DefaultLanguage = dbo.vw_Portals.CultureCode)
GO
