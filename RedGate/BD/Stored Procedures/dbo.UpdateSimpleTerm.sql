SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSimpleTerm] 
	@TermID					int,
	@VocabularyID			int,
	@Name					nvarchar(250),
	@Description			nvarchar(2500),
	@Weight					int,
	@LastModifiedByUserID	int
AS
	UPDATE dbo.Taxonomy_Terms
		SET 
			VocabularyID = @VocabularyID,
			[Name] = @Name,
			Description = @Description,
			Weight = @Weight,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate()
	WHERE TermID = @TermID
GO
