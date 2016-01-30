SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddHostSetting]

	@SettingName		nvarchar(50),
	@SettingValue		nvarchar(256),
	@SettingIsSecure	bit,
	@CreatedByUserID	int
AS
	insert into HostSettings (
	  SettingName,
	  SettingValue,
	  SettingIsSecure,
	  [CreatedByUserID],
	  [CreatedOnDate],
	  [LastModifiedByUserID],
	  [LastModifiedOnDate]
	) 
	values (
	  @SettingName,
	  @SettingValue,
	  @SettingIsSecure,
	  @CreatedByUserID,
	  getdate(),
	  @CreatedByUserID,
	  getdate()
	)
GO
