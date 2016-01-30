SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabModuleSettingsByTab]
    @TabId Int
AS
	BEGIN
		SELECT
			TMS.TabModuleID,
			TMS.SettingName,
			CASE WHEN Lower(TMS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(TMS.SettingValue)
				 ELSE TMS.SettingValue END           
				 AS SettingValue
		FROM   dbo.[TabModuleSettings] TMS
			INNER JOIN dbo.[TabModules] TM ON TMS.TabModuleID = TM.TabModuleID
		WHERE  TM.TabID = @TabId
		ORDER BY TMS.TabModuleID
	END
GO
