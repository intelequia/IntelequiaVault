SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteVocabulary] 
	@VocabularyID			int
AS
	DELETE FROM dbo.Taxonomy_Vocabularies
	WHERE VocabularyID = @VocabularyID
GO
