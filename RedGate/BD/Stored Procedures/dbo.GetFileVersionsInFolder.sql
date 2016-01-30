SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileVersionsInFolder]
@FolderId int
AS
BEGIN
	SELECT 
	   fv.[FileId]
      ,fv.[Version]
      ,fv.[FileName]
      ,fv.[Extension]
      ,fv.[Size]
      ,fv.[Width]
      ,fv.[Height]
      ,fv.[ContentType]
      ,fv.[CreatedByUserID]
      ,fv.[CreatedOnDate]
      ,fv.[LastModifiedByUserID]
      ,fv.[LastModifiedOnDate]
      ,fv.[SHA1Hash]
	FROM dbo.FileVersions fv, dbo.Files f
    WHERE fv.FileId = f.FileId and f.FolderId = @FolderId
END
GO
