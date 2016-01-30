SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_MasterPortals]
AS
	SELECT  P.PortalID,
			P.PortalGroupID,
			IsNull(G.MasterPortalID, P.PortalID) AS MasterPortalID
	FROM      dbo.[Portals] AS P
	LEFT JOIN dbo.[PortalGroups] AS G ON P.PortalGroupID = G.PortalGroupID
GO
