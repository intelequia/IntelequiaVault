SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_AddOrUpdateEditorHostSetting]
    @SettingName		nvarchar(300),
	@SettingValue		ntext
AS
    if exists (select 1 from dbo.CKE_Settings where SettingName = @SettingName)
	    begin
		    update dbo.CKE_Settings 
			   set
			       SettingValue = @SettingValue
			   where
			       SettingName = @SettingName
		end
    else 
	    begin
		    insert into dbo.CKE_Settings (SettingName, SettingValue) 
	                    values (@SettingName,@SettingValue)
		end
GO
