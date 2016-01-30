SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModuleSettings]
    @TabModuleId Int -- Null: all tabmodules
AS
	BEGIN
		SELECT
			TMS.SettingName,
			CASE WHEN Lower(TMS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(TMS.SettingValue)
				 ELSE TMS.SettingValue END           AS SettingValue
		FROM   dbo.[TabModuleSettings] TMS
		WHERE  TabModuleID = @TabModuleId OR IsNull(@TabModuleId, -1) = -1
		OPTION (OPTIMIZE FOR (@TabModuleId UNKNOWN))
	END
GO
