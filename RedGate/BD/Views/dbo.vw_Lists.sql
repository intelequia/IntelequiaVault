SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- optimized
CREATE VIEW [dbo].[vw_Lists]
AS
	SELECT  L.EntryID, 
		L.ListName, 
		L.[Value], 
		L.Text, 
		L.[Level], 
		L.SortOrder, 
		L.DefinitionID, 
		L.ParentID, 
		L.Description, 
		L.PortalID, 
		L.SystemList, 
		dbo.[GetListParentKey](L.ParentID, L.ListName, N'ParentKey',  0) AS ParentKey, 
		dbo.[GetListParentKey](L.ParentID, L.ListName, N'Parent',     0) AS Parent, 
		dbo.[GetListParentKey](L.ParentID, L.ListName, N'ParentList', 0) AS ParentList,
		S.MaxSortOrder,
		S.EntryCount,
		CASE WHEN EXISTS (SELECT 1 FROM dbo.[Lists] WHERE (ParentID = L.EntryID)) THEN 1 ELSE 0 END AS HasChildren, 
		L.CreatedByUserID, 
		L.CreatedOnDate, 
		L.LastModifiedByUserID, 
		L.LastModifiedOnDate
	FROM dbo.[Lists] AS L
	LEFT JOIN (SELECT ListName, ParentID, Max(SortOrder) AS MaxSortOrder, Count(1) AS EntryCount 
			   FROM dbo.[Lists] GROUP BY ListName, ParentID) S 		ON L.ParentID = S.ParentId AND L.ListName = S.ListName
GO
