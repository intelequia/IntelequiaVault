SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSynonymsGroup]
	@SynonymsGroupID		int,
	@SynonymsTags 			nvarchar(MAX),
	@LastModifiedByUserID 	int
AS
BEGIN	
	UPDATE dbo.SynonymsGroups
			SET				
				SynonymsTags = @SynonymsTags,
				LastModifiedByUserID = @LastModifiedByUserID,
				LastModifiedOnDate = GETUTCDATE()
			WHERE SynonymsGroupID = @SynonymsGroupID
END
GO
