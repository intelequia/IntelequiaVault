SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFolderMapping]
	@FolderMappingID int
AS
BEGIN
	DELETE
	FROM dbo.[FolderMappings]
	WHERE FolderMappingID = @FolderMappingID
END
GO
