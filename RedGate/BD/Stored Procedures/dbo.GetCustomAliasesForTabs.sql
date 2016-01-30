SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetCustomAliasesForTabs] 
AS
	SELECT HttpAlias
	FROM  dbo.[PortalAlias] pa 
	WHERE PortalAliasId IN (SELECT PortalAliasId FROM dbo.[TabUrls])
	ORDER BY HttpAlias
GO
