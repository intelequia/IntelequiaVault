SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleSettingsByTab]
    @TabId Int
AS
	BEGIN
		SELECT
			MS.ModuleID,
			MS.SettingName,
			CASE WHEN Lower(MS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(MS.SettingValue)
				 ELSE MS.SettingValue END           
				 AS SettingValue
		FROM   dbo.[ModuleSettings] MS
			INNER JOIN dbo.[TabModules] TM ON MS.ModuleID = TM.ModuleID
		WHERE  TM.TabID = @TabId
		ORDER BY MS.ModuleID
	END
GO
