SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTermsByContent] 
	@ContentItemID			int
AS
	SELECT TT.*
	FROM dbo.ContentItems_Tags TG
		INNER JOIN dbo.Taxonomy_Terms TT ON TG.TermID = TT.TermID
	WHERE TG.ContentItemID = @ContentItemID
GO
