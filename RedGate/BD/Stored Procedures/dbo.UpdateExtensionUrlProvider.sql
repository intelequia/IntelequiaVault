SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateExtensionUrlProvider] 
	@ExtensionUrlProviderID		int,
	@IsActive					bit
AS
	UPDATE dbo.ExtensionUrlProviders
		SET IsActive = @IsActive
		WHERE ExtensionUrlProviderID = @ExtensionUrlProviderID
GO
