SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFileHashCode]
	@FileId				  Int, 		-- Not Null
	@HashCode VARCHAR(40)  -- Not NULL
AS
BEGIN
    UPDATE dbo.[Files]
    SET    SHA1Hash = @HashCode
    WHERE  FileId = @FileId
END
GO
