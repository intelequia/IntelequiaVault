SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateContentType] 
	@ContentTypeId		int,
	@ContentType		nvarchar(250)
AS
	UPDATE dbo.ContentTypes 
		SET 
			ContentType = @ContentType
	WHERE ContentTypeId = @ContentTypeId
GO
