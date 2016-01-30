SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleSettings]
    @ModuleId Int -- Null: settings from all modules
AS
	BEGIN
		SELECT
			MS.SettingName,
			CASE WHEN Lower(MS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(MS.SettingValue)
				 ELSE MS.SettingValue END           AS SettingValue
		FROM   dbo.[ModuleSettings] MS
		WHERE  ModuleID = @ModuleId or IsNull(@ModuleId, -1) = -1
		OPTION (OPTIMIZE FOR (@ModuleId UNKNOWN))
	END
GO
