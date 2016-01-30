SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetListEntries]
	@ListName nvarchar(50),
	@ParentKey nvarchar(150),
	@PortalID int
AS
SELECT *
	FROM dbo.vw_Lists
	WHERE (ListName = @ListName OR @ListName='')
		AND (ParentKey = @ParentKey OR @ParentKey = '')
		AND (PortalID = @PortalID OR PortalID = -1 OR @PortalID IS NULL or SystemList=1)
	ORDER BY [Level], ListName, SortOrder, Text
GO
