SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SearchDeletedItems_Add]
	@document nvarchar(max)
AS
BEGIN
	INSERT INTO dbo.SearchDeletedItems
		   (  document )
	VALUES ( @document )
END
GO
