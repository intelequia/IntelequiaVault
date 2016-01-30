SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddExtensionUrlProvider] 
	@ExtensionUrlProviderID	int, 
    @DesktopModuleId		int, 
    @ProviderName			nvarchar(150), 
    @ProviderType			nvarchar(1000), 
    @SettingsControlSrc		nvarchar(1000), 
    @IsActive				bit, 
    @RewriteAllUrls			bit, 
    @RedirectAllUrls		bit, 
    @ReplaceAllUrls			bit
AS

IF EXISTS (SELECT * FROM dbo.ExtensionUrlProviders WHERE ExtensionUrlProviderID = @ExtensionUrlProviderID)
	BEGIN
		UPDATE dbo.ExtensionUrlProviders
			SET
				DesktopModuleId = @DesktopModuleId,
				ProviderName = @ProviderName,
				ProviderType = @ProviderType,
				SettingsControlSrc = @SettingsControlSrc,
				IsActive = @IsActive,
				RewriteAllUrls = @RewriteAllUrls,
				RedirectAllUrls = @RedirectAllUrls,
				ReplaceAllUrls = @ReplaceAllUrls
			WHERE ExtensionUrlProviderID = @ExtensionUrlProviderID
	END
ELSE
	BEGIN
		INSERT INTO dbo.ExtensionUrlProviders (
				DesktopModuleId,
				ProviderName,
				ProviderType,
				SettingsControlSrc,
				IsActive,
				RewriteAllUrls,
				RedirectAllUrls,
				ReplaceAllUrls
		)
		VALUES (
				@DesktopModuleId,
				@ProviderName,
				@ProviderType,
				@SettingsControlSrc,
				@IsActive,
				@RewriteAllUrls,
				@RedirectAllUrls,
				@ReplaceAllUrls
		)
		
		SET @ExtensionUrlProviderID = @@IDENTITY
		
	END
	
SELECT @ExtensionUrlProviderID
GO
