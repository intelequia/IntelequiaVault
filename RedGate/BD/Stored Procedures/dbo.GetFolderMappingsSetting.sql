SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderMappingsSetting]
	@FolderMappingID int,
	@SettingName nvarchar(50)
AS
BEGIN
	SELECT *
	FROM dbo.[FolderMappingsSettings]
	WHERE FolderMappingID = @FolderMappingID AND SettingName = @SettingName
END
GO
