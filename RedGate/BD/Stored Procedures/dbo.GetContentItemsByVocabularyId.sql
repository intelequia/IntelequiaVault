SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItemsByVocabularyId] 
	@VocabularyID int
AS
BEGIN
	SELECT c.*
	FROM dbo.ContentItems As c
		INNER JOIN dbo.ContentItems_Tags ct ON ct.ContentItemID = c.ContentItemID
		INNER JOIN dbo.Taxonomy_Terms t ON t.TermID = ct.TermID
	WHERE t.VocabularyID = @VocabularyID
END
GO
