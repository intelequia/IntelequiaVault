SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItem] 
	@ContentItemId			int
AS
	SELECT *
	FROM dbo.ContentItems
	WHERE ContentItemId = @ContentItemId
GO
