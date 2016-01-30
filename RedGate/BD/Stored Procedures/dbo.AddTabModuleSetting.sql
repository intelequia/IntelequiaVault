SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddTabModuleSetting]
	@TabModuleId   		int,
	@SettingName   		nvarchar(50),
	@SettingValue  		nvarchar(max),
	@CreatedByUserID  	int
AS
	INSERT INTO dbo.TabModuleSettings ( 
		TabModuleId,
		SettingName, 
		SettingValue,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	) 
	VALUES ( 
		@TabModuleId,
		@SettingName, 
		@SettingValue,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)
GO
