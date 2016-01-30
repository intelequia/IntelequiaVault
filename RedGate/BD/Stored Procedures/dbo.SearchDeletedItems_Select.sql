SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SearchDeletedItems_Select]
    @CutoffTime	DATETIME
AS
BEGIN
	SELECT document
	FROM dbo.SearchDeletedItems
	WHERE [DateCreated] < @CutoffTime
	ORDER BY [DateCreated]
END
GO
