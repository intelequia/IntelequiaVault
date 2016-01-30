SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetLists]
	
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
	WHERE PortalID = @PortalID
	ORDER BY [Level], ListName
GO
