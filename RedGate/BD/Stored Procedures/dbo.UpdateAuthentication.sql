SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateAuthentication]
	@AuthenticationID       int,
	@PackageID				int,
	@AuthenticationType     nvarchar(100),
	@IsEnabled				bit,
	@SettingsControlSrc     nvarchar(250),
	@LoginControlSrc		nvarchar(250),
	@LogoffControlSrc		nvarchar(250),
	@LastModifiedByUserID	int
AS
	UPDATE dbo.Authentication
	SET    PackageID = @PackageID,
		   AuthenticationType = @AuthenticationType,
		   IsEnabled = @IsEnabled,
		   SettingsControlSrc = @SettingsControlSrc,
		   LoginControlSrc = @LoginControlSrc,
		   LogoffControlSrc = @LogoffControlSrc,
		   [LastModifiedByUserID] = @LastModifiedByUserID,	
		   [LastModifiedOnDate] = getdate()
	WHERE  AuthenticationID = @AuthenticationID
GO
