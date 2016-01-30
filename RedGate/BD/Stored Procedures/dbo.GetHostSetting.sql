SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetHostSetting]

@SettingName nvarchar(50)

as

select SettingValue
from dbo.HostSettings
where  SettingName = @SettingName
GO
