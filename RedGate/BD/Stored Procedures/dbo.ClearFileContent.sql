SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClearFileContent]

	@FileId      int

AS

UPDATE dbo.Files
	SET    Content = NULL
	WHERE  FileId = @FileId
GO
