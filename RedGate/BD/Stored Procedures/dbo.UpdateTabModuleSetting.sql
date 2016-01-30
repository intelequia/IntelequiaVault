SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabModuleSetting]
	@TabModuleId			int,
	@SettingName			nvarchar(50),
	@SettingValue			nvarchar(max),
	@LastModifiedByUserID	int

AS
	UPDATE dbo.TabModuleSettings
		SET    SettingValue = @SettingValue,
			   LastModifiedByUserID = @LastModifiedByUserID,
			   LastModifiedOnDate = getdate()
		WHERE  TabModuleId = @TabModuleId
		AND    SettingName = @SettingName
GO
