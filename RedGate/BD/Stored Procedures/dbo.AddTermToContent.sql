SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddTermToContent] 
	@TermID			int,
	@ContentItemID	int
AS
	INSERT INTO dbo.ContentItems_Tags (
		TermID,
		ContentItemID
	)

	VALUES (
		@TermID,
		@ContentItemID
	)

	SELECT SCOPE_IDENTITY()
GO
