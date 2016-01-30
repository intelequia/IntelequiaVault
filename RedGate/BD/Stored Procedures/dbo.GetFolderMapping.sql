SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderMapping]
	@FolderMappingID int
AS
BEGIN
	SELECT *
	FROM dbo.[FolderMappings]
	WHERE FolderMappingID = @FolderMappingID
END
GO
