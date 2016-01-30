SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabSettings]
    @PortalId Int
AS
	BEGIN
		SELECT
			TS.TabID,
			TS.SettingName,
			CASE WHEN Lower(TS.SettingValue) LIKE 'fileid=%'
				 THEN dbo.FilePath(TS.SettingValue)
				 ELSE TS.SettingValue END           
				 AS SettingValue
		FROM   dbo.[TabSettings] TS
			INNER JOIN dbo.[Tabs] T ON t.TabID = TS.TabID
		WHERE  (PortalId = @PortalId)
		ORDER BY TS.TabID
	END
GO
