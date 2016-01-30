SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileVersions] 
@FileId int
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
	WHERE fv.FileId = @FileId
END
GO
