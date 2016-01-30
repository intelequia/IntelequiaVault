SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteExtensionUrlProvider] 
	@ExtensionUrlProviderID	int
AS

DELETE FROM dbo.ExtensionUrlProviders
	WHERE ExtensionUrlProviderID = @ExtensionUrlProviderID
GO
