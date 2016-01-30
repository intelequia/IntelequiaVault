SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddMetaData] 
	@ContentItemID		int,
	@Name				nvarchar(100),
	@Value				nvarchar(MAX)
AS
	DECLARE @MetaDataID	int
	SET @MetaDataID = (SELECT MetaDataID FROM MetaData WHERE MetaDataName = @Name)
	
	IF @MetaDataID IS NULL
		BEGIN
			--Insert new item into MetaData table
			INSERT INTO dbo.MetaData ( MetaDataName ) VALUES ( @Name )

			SET @MetaDataID = (SELECT SCOPE_IDENTITY() )
		END
		
	INSERT INTO dbo.ContentItems_MetaData (
		ContentItemID,
		MetaDataID,
		MetaDataValue
	)
	VALUES (
		@ContentItemID,
		@MetaDataID,
		@Value
	)
GO
