SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSearchWord]
	@SearchWordsID int
AS

DELETE FROM dbo.SearchWord
WHERE
	[SearchWordsID] = @SearchWordsID
GO
