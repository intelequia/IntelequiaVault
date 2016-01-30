SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModule]
	@ModuleId					int,
    @ModuleDefId                int,
	@ContentItemID				int,
	@AllTabs					bit, 
	@StartDate					datetime,
	@EndDate					datetime,
	@InheritViewPermissions		bit,
	@IsShareable				bit,
	@IsShareableViewOnly		bit,
	@IsDeleted					bit,
	@LastModifiedByUserID  		int
	
AS
	UPDATE	dbo.Modules
		SET		
			ModuleDefId = @ModuleDefId,
            ContentItemID = @ContentItemID,
			AllTabs = @AllTabs,
			StartDate = @StartDate,
			EndDate = @EndDate,
			InheritViewPermissions = @InheritViewPermissions,
			IsShareable = @IsShareable,
			IsShareableViewOnly = @IsShareableViewOnly,
			IsDeleted = @IsDeleted,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate()
	WHERE  ModuleId = @ModuleId
GO
