SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddDesktopModule]
	@PackageID		int,
	@ModuleName		nvarchar(128),
	@FolderName		nvarchar(128),
	@FriendlyName		nvarchar(128),
	@Description		nvarchar(2000),
	@Version		nvarchar(8),
	@IsPremium		bit,
	@IsAdmin		bit,
	@BusinessController	nvarchar(200),
	@SupportedFeatures	int,
	@Shareable		int,
	@CompatibleVersions	nvarchar(500),
	@Dependencies		nvarchar(400),
	@Permissions		nvarchar(400),
	@ContentItemId		int,
	@CreatedByUserID	int,
	@AdminPage		nvarchar(128),
	@HostPage		nvarchar(128)

AS
	INSERT INTO dbo.DesktopModules (
		PackageID,
		ModuleName,
		FolderName,
		FriendlyName,
		Description,
		Version,
		IsPremium,
		IsAdmin,
		BusinessControllerClass,
		SupportedFeatures,
		Shareable,
		CompatibleVersions,
		Dependencies,
		Permissions,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate,
		ContentItemId,
		AdminPage,
		HostPage
	)
	VALUES (
		@PackageID,
		@ModuleName,
		@FolderName,
		@FriendlyName,
		@Description,
		@Version,
		@IsPremium,
		@IsAdmin,
		@BusinessController,
		@SupportedFeatures,
		@Shareable,
		@CompatibleVersions,
		@Dependencies,
		@Permissions,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate(),
		@ContentItemId,
		@AdminPage,
		@HostPage
	)

	SELECT SCOPE_IDENTITY()
GO
