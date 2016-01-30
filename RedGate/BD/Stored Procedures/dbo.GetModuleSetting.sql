SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleSetting]
    @ModuleId      Int,          -- not null!
    @SettingName   nVarChar(50)  -- not null or empty!
AS
	BEGIN
		SELECT
			MS.SettingName,
			CASE WHEN Lower(MS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(MS.SettingValue)
				 ELSE MS.SettingValue  END AS SettingValue
		FROM dbo.[ModuleSettings] MS
		WHERE  ModuleID = @ModuleId AND SettingName = @SettingName
	END
GO
