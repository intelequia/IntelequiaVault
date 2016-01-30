SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabAliasSkins] 
(
	 @PortalID		int 
)
AS
	SELECT 
		t.TabId, 
		pa.PortalAliasId, 
		pa.HttpAlias, 
		t.SkinSrc, 
		t.CreatedByUserId, 
		t.CreatedOnDate, 
		t.LastModifiedByUserId, 
		t.LastModifiedOnDate
	FROM dbo.TabAliasSkins t
		INNER JOIN dbo.PortalAlias pa ON t.PortalAliasId = pa.PortalAliasId
	WHERE pa.PortalID = @PortalID OR @PortalID = -1
GO
