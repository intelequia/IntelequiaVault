SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SearchDeletedItems_DeleteProcessed]
    @CutoffTime	DATETIME
AS
BEGIN
	DELETE FROM dbo.SearchDeletedItems
	WHERE [DateCreated] < @CutoffTime
END
GO
