SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ImportDocumentLibraryCategories]
	@VocabularyID 				int
AS
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.[dlfp_Category]') AND type in (N'U'))
	BEGIN
		INSERT INTO dbo.Taxonomy_Terms([Name],[VocabularyID])
		SELECT DISTINCT CategoryName,VID=@VocabularyID
		FROM         dbo.dlfp_Category where CategoryName NOT IN (SELECT [name] from dbo.Taxonomy_Terms)
	END
GO
