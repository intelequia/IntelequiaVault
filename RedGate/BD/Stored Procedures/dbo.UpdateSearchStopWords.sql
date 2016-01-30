SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSearchStopWords]
	@StopWordsID		int,
	@StopWords 			nvarchar(MAX),
	@LastModifiedByUserID 	int
AS
BEGIN	
	UPDATE dbo.SearchStopWords
			SET				
				StopWords = @StopWords,
				LastModifiedByUserID = @LastModifiedByUserID,
				LastModifiedOnDate = GETUTCDATE()
			WHERE StopWordsID = @StopWordsID
END
GO
