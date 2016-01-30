SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabCustomAliases] 
(
	 @PortalID		int 
)
AS
	SELECT 
		t.TabId, 
		Coalesce(trp.CultureCode, '') as CultureCode, 
		pa.HttpAlias
	FROM dbo.Tabs t
		INNER JOIN dbo.TabUrls trp ON trp.TabId = t.ParentId	
		INNER JOIN dbo.PortalAlias pa ON trp.PortalAliasId = pa.PortalAliasId
		WHERE trp.PortalAliasUsage = 1 /* child tabs inherit */
		  AND (@portalId = t.PortalId OR @portalId = -1)
		  AND NOT EXISTS (SELECT tr2.TabId 
							FROM dbo.TabUrls tr2 
							WHERE tr2.TabId = t.TabId 
								AND tr2.CultureCode = trp.CultureCode
							)
GO
