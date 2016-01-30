SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteList]
	@ListName  nVarChar( 50), -- Not Null
	@ParentKey nVarChar(150)  -- Not Null
AS
BEGIN
	DELETE L
	 FROM  dbo.[Lists] L
	 WHERE ListName = @ListName 
	   AND dbo.[GetListParentKey](L.ParentID, L.ListName, N'ParentKey',  0) = @ParentKey;
END
GO
