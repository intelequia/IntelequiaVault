SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderMappingsSettings]
	@FolderMappingID int
AS
BEGIN
	SELECT SettingName, SettingValue
	FROM dbo.[FolderMappingsSettings]
	WHERE FolderMappingID = @FolderMappingID
END
GO
