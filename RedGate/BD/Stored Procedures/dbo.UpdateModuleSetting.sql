SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModuleSetting]
	@ModuleId				int,
	@SettingName			nvarchar(50),
	@SettingValue			nvarchar(max),
	@LastModifiedByUserID  	int
AS
	UPDATE 	dbo.ModuleSettings
		SET 	SettingValue = @SettingValue,
				LastModifiedByUserID = @LastModifiedByUserID,
				LastModifiedOnDate = getdate()
		WHERE ModuleId = @ModuleId
		AND SettingName = @SettingName
GO
