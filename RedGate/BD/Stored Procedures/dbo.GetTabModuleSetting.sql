SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModuleSetting]
    @TabModuleId   Int,              -- not null!
    @SettingName   nVarChar(50)      -- not null or empty!
AS
	BEGIN
		SELECT
			TMS.SettingName,
			CASE WHEN TMS.SettingValue LIKE 'fileid%'
				 THEN dbo.FilePath(TMS.SettingValue)
				 ELSE TMS.SettingValue  END AS SettingValue
		FROM dbo.[TabModuleSettings] TMS
		WHERE  TabModuleID = @TabModuleId AND SettingName = @SettingName
	END
GO
