SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddScheduleItemSetting]
	@ScheduleID int,
	@Name nvarchar(50),
	@Value nvarchar(256)
AS
BEGIN
	UPDATE dbo.[ScheduleItemSettings]
	SET SettingValue = @Value
	WHERE ScheduleID = @ScheduleID
	AND SettingName = @Name

	IF @@ROWCOUNT = 0 BEGIN
		INSERT INTO dbo.[ScheduleItemSettings] (ScheduleID, SettingName, Settingvalue)
		VALUES (@ScheduleID, @Name, @Value)
	END
END
GO
