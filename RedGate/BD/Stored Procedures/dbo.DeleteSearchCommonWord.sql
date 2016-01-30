SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSearchCommonWord]
	@CommonWordID int
AS

DELETE FROM dbo.SearchCommonWords
WHERE
	[CommonWordID] = @CommonWordID
GO
