SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddModule]
	@ContentItemID				int,
	@PortalID					int,
	@ModuleDefId				int,
	@AllTabs					bit,
	@StartDate					datetime,
	@EndDate					datetime,
	@InheritViewPermissions     bit,
	@IsShareable				bit,
	@IsShareableViewOnly		bit,
	@IsDeleted					bit,
	@CreatedByUserID  			int
	
AS
	INSERT INTO dbo.Modules (
		ContentItemID, 
		PortalId,
		ModuleDefId,
		AllTabs,
		StartDate,
		EndDate,
		InheritViewPermissions,
		IsShareable,
		IsShareableViewOnly,
		IsDeleted,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	)
	VALUES (
		@ContentItemID,
		@PortalID,
		@ModuleDefId,
		@AllTabs,
		@StartDate,
		@EndDate,
		@InheritViewPermissions,
		@IsShareable,
		@IsShareableViewOnly,
		@IsDeleted,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)

	SELECT SCOPE_IDENTITY()
GO
