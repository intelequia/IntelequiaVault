SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateDesktopModule]
	@DesktopModuleId		int,    
	@PackageID			int,
	@ModuleName			nvarchar(128),
	@FolderName			nvarchar(128),
	@FriendlyName			nvarchar(128),
	@Description			nvarchar(2000),
	@Version			nvarchar(8),
	@IsPremium			bit,
	@IsAdmin			bit,
	@BusinessController		nvarchar(200),
	@SupportedFeatures		int,
	@Shareable			int,
	@CompatibleVersions		nvarchar(500),
	@Dependencies			nvarchar(400),
	@Permissions			nvarchar(400),
	@ContentItemId			int,
	@LastModifiedByUserID		int,
	@AdminPage		nvarchar(128),
	@HostPage		nvarchar(128)

AS
		UPDATE dbo.DesktopModules
		SET    	
			PackageID = @PackageID,
			ModuleName = @ModuleName,
			FolderName = @FolderName,
			FriendlyName = @FriendlyName,
			Description = @Description,
			Version = @Version,
			IsPremium = @IsPremium,
			IsAdmin = @IsAdmin,
			BusinessControllerClass = @BusinessController,
			SupportedFeatures = @SupportedFeatures,
			Shareable = @Shareable,
			CompatibleVersions = @CompatibleVersions,
			Dependencies = @Dependencies,
			Permissions = @Permissions,
			ContentItemId = @ContentItemId,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate(),
			AdminPage=@AdminPage,
			HostPage=@HostPage
	WHERE  DesktopModuleId = @DesktopModuleId
GO
