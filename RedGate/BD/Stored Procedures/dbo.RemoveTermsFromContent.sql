SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveTermsFromContent] 
	@ContentItemID	int
AS
	DELETE dbo.ContentItems_Tags 
	WHERE ContentItemID = @ContentItemID
GO
