SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateHostSetting]
	@SettingName			nvarchar(50),
	@SettingValue			nvarchar(256),
	@SettingIsSecure		bit,
	@LastModifiedByUserID	int
AS
	UPDATE HostSettings
		SET    
			SettingValue = @SettingValue, 
			SettingIsSecure = @SettingIsSecure,
			[LastModifiedByUserID] = @LastModifiedByUserID,	
			[LastModifiedOnDate] = getdate()
	WHERE  SettingName = @SettingName
GO
