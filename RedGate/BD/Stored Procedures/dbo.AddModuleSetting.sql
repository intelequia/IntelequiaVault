SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddModuleSetting]
	@ModuleId			int,
	@SettingName		nvarchar(50),
	@SettingValue		nvarchar(max),
	@CreatedByUserID	int
AS
	INSERT INTO dbo.ModuleSettings ( 
		ModuleId,
		SettingName,
		SettingValue,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	) 
	VALUES ( 
		@ModuleId, 
		@SettingName, 
		@SettingValue,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)
GO
