SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFileLastModificationTime]
	@FileId				  Int, 		-- Not Null
	@LastModificationTime DateTime  -- Null: Now
AS
BEGIN
    UPDATE dbo.[Files]
    SET    LastModificationTime = IsNull(@LastModificationTime, GetDate())
    WHERE  FileId = @FileId
END
GO
