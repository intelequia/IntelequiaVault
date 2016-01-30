SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteMetaData] 
	@ContentItemId		int,
	@Name				nvarchar(100),
	@Value				nvarchar(MAX)
	
AS
	DELETE FROM dbo.ContentItems_MetaData
	FROM dbo.ContentItems_MetaData AS cm
		INNER JOIN dbo.MetaData AS m ON cm.MetaDataID = m.MetaDataID
	WHERE cm.ContentItemId = @ContentItemId AND m.MetaDataName = @Name AND cm.MetaDataValue = @Value
GO
