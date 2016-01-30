SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabs]
	@PortalID Int  -- Null|-1 for host pages
AS
	SELECT *
	FROM   dbo.[vw_Tabs]
	WHERE  IsNull(PortalId, -1) = IsNull(@PortalID, -1)
	ORDER BY PortalId, [Level], ParentID, TabOrder -- PortalId added for query optimization
GO
