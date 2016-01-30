SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetList]
	@ListName nvarchar(50),
	@ParentKey nvarchar(150),
	@PortalID int
AS
SELECT DISTINCT
		ListName,
		[Level],
		DefinitionID,
		PortalID,
		SystemList,
		EntryCount,
		ParentID,
		ParentKey,
		Parent,
		ParentList,
		MaxSortOrder
	FROM dbo.vw_Lists
	WHERE ListName = @ListName
		AND ParentKey = @ParentKey
		AND PortalID = @PortalID
	ORDER BY [Level], ListName
GO
