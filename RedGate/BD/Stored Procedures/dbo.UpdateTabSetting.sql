SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabSetting]
	@TabID					INT,
	@SettingName			NVARCHAR(50),
	@SettingValue			NVARCHAR(2000),
	@LastModifiedByUserID  	INT
AS

	UPDATE 	dbo.TabSettings
	SET 	SettingValue = @SettingValue,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = GETDATE()
	WHERE TabID = @TabID
		AND SettingName = @SettingName
GO
