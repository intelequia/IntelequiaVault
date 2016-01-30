SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSearchCommonWord]
	@CommonWordID int, 
	@CommonWord nvarchar(255), 
	@Locale nvarchar(10) 
AS

UPDATE dbo.SearchCommonWords SET
	[CommonWord] = @CommonWord,
	[Locale] = @Locale
WHERE
	[CommonWordID] = @CommonWordID
GO
