SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFolderMappingsSetting]
	@FolderMappingID int,
	@SettingName nvarchar(50),
	@SettingValue nvarchar(2000),
	@LastModifiedByUserID int
AS
BEGIN
	UPDATE dbo.[FolderMappingsSettings]
	SET
		SettingValue = @SettingValue,
		LastModifiedByUserID = @LastModifiedByUserID,
		LastModifiedOnDate = GETDATE()
	WHERE FolderMappingID = @FolderMappingID AND SettingName = @SettingName
END
GO
