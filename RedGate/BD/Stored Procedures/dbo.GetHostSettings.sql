SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetHostSettings]
AS
	IF NOT EXISTS ( select 1 from dbo.HostSettings where SettingName = 'GUID' )
	  INSERT INTO dbo.HostSettings ( SettingName, SettingValue, SettingIsSecure ) values ( 'GUID', newid(), 0 )

	SELECT SettingName,
		   SettingValue,
		   SettingIsSecure,
		   CreatedByUserID,
		   CreatedOnDate,
	       LastModifiedByUserID,
		   LastModifiedOnDate
	FROM   dbo.HostSettings
GO
