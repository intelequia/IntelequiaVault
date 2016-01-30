SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteTabModuleSetting]
@TabModuleId      int,
@SettingName   nvarchar(50)
as

DELETE FROM TabModuleSettings 
WHERE TabModuleId = @TabModuleId
AND SettingName = @SettingName
GO
