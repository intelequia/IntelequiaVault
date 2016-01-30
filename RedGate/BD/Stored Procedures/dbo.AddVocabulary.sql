SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddVocabulary] 
	@VocabularyTypeID	int,
	@Name				nvarchar(250),
	@Description		nvarchar(2500),
	@Weight				int,
	@ScopeID			int,
	@ScopeTypeID		int,
	@CreatedByUserID	int
AS
	INSERT INTO dbo.Taxonomy_Vocabularies (
		VocabularyTypeID,
		[Name],
		Description,
		Weight,
		ScopeID,
		ScopeTypeID,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	)

	VALUES (
		@VocabularyTypeID,
		@Name,
		@Description,
		@Weight,
		@ScopeID,
		@ScopeTypeID,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)

	SELECT SCOPE_IDENTITY()
GO
