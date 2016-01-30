SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSearchCommonWordsByLocale]
	@Locale nvarchar(10)
	
AS

SELECT
	[CommonWordID],
	[CommonWord],
	[Locale]
FROM
	dbo.SearchCommonWords
WHERE
	[Locale] = @Locale
GO
