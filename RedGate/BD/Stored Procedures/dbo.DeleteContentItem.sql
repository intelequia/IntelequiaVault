SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteContentItem] 
	@ContentItemId			int
AS
	DELETE FROM dbo.ContentItems
	WHERE ContentItemId = @ContentItemId
GO
