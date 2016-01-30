SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSearchCommonWordByID]
	@CommonWordID int
	
AS

SELECT
	[CommonWordID],
	[CommonWord],
	[Locale]
FROM
	dbo.SearchCommonWords
WHERE
	[CommonWordID] = @CommonWordID
GO
