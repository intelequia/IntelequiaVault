SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderByFolderPath]
 @PortalID int,
 @FolderPath nvarchar(300)
AS
BEGIN
 if @PortalID is not null
 begin
  SELECT *
  FROM dbo.Folders
  WHERE PortalID = @PortalID AND FolderPath = @FolderPath
 end else begin
  SELECT *
  FROM dbo.Folders
  WHERE PortalID is null AND  FolderPath = @FolderPath
 end
END
GO
