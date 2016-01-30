SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetMetaData] 
	@ContentItemId   int
AS
	SELECT md.MetaDataName, cmd.MetaDataValue
	FROM dbo.[ContentItems_MetaData] cmd
	JOIN dbo.[MetaData] md on (cmd.MetaDataID = md.MetaDataID)
	WHERE ContentItemId = @ContentItemId
GO
