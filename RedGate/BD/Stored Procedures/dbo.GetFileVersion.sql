SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileVersion] 
	@FileId int,
	@Version int
AS
BEGIN
	SELECT 
	   [FileId]
      ,[Version]
      ,[FileName]
      ,[Extension]
      ,[Size]
      ,[Width]
      ,[Height]
      ,[ContentType]
      ,[CreatedByUserID]
      ,[CreatedOnDate]
      ,[LastModifiedByUserID]
      ,[LastModifiedOnDate]
      ,[SHA1Hash]
	FROM dbo.FileVersions fv
	WHERE FileId = @FileId
	  AND Version = @Version
END
GO
