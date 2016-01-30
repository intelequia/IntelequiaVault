SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTermsByVocabulary] 
	@VocabularyID			int
AS
	SELECT TT.*
	FROM dbo.Taxonomy_Terms TT
	WHERE VocabularyID = @VocabularyID
	ORDER BY TT.TermLeft Asc, TT.Weight Asc, TT.Name Asc
GO
