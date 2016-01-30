SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabSetting]

    @TabId         Int,         -- not null!
    @SettingName   nVarChar(50) -- not null or empty!

AS
	BEGIN
		SELECT
			TS.SettingName,
			CASE WHEN TS.SettingValue LIKE 'fileid%'
				 THEN dbo.FilePath(TS.SettingValue)
				 ELSE TS.SettingValue  END AS SettingValue
		FROM dbo.[TabSettings] TS
		WHERE  TabID = @TabId AND SettingName = @SettingName
	END
GO
