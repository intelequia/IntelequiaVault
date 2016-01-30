SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddFolderMappingsSetting]
	@FolderMappingID int,
	@SettingName nvarchar(50),
	@SettingValue nvarchar(2000),
	@CreatedByUserID int
AS
BEGIN
	INSERT INTO dbo.[FolderMappingsSettings] (
		FolderMappingID,
		SettingName,
		SettingValue,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	)
	VALUES (
		@FolderMappingID,
		@SettingName,
		@SettingValue,
		@CreatedByUserID,
		GETDATE(),
		@CreatedByUserID,
		GETDATE()
	)
END
GO
