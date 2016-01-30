SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetFileFolderFunc](@FolderD INT)
RETURNS nvarchar(246) 
AS
BEGIN
    DECLARE @folderPath nvarchar(246)
    select @folderPath=folderpath from dbo.[Folders] where folderid=@FolderD
return @folderPath
  
END;
GO
