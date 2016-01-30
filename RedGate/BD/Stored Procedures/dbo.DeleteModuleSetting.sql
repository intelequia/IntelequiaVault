SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteModuleSetting]
@ModuleId      int,
@SettingName   nvarchar(50)
as

DELETE FROM dbo.ModuleSettings 
WHERE ModuleId = @ModuleId
AND SettingName = @SettingName
GO
