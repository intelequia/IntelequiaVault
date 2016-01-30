SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ResetFilePublishedVersion] 
@FileId int
AS
BEGIN
	UPDATE dbo.Files
		SET PublishedVersion = 1
		WHERE FileId = @FileId
END
GO
