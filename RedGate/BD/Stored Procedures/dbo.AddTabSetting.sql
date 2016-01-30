SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddTabSetting]
	@TabID				INT,
	@SettingName		NVARCHAR(50),
	@SettingValue		NVARCHAR(2000),
	@CreatedByUserID	INT

AS

	INSERT INTO dbo.TabSettings ( 
		TabID,
		SettingName,
		SettingValue,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	) 
	VALUES ( 
		@TabId, 
		@SettingName, 
		@SettingValue,
		@CreatedByUserID,
		GETDATE(),
		@CreatedByUserID,
		GETDATE()
	)
GO
