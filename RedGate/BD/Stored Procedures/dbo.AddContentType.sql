SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentType] 
	@ContentType	nvarchar(250)
AS
	INSERT INTO dbo.ContentTypes (
		ContentType
	)

	VALUES (
		@ContentType
	)

	SELECT SCOPE_IDENTITY()
GO
