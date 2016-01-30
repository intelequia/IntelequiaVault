SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteContentType] 
	@ContentTypeId	int
AS
	DELETE FROM dbo.ContentTypes
	WHERE ContentTypeId = @ContentTypeId
GO
