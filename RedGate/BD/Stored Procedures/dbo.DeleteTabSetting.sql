SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTabSetting]
	@TabID      	INT,
	@SettingName	NVARCHAR(50)

AS

	DELETE	FROM dbo.TabSettings 
	WHERE	TabID = @TabID
	AND		SettingName = @SettingName
GO
