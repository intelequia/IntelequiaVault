SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabModuleTranslationStatus]
	@TabModuleId			int,
    @LocalizedVersionGuid	uniqueidentifier,
	@LastModifiedByUserID	int
AS
	UPDATE dbo.TabModules
		SET
		LocalizedVersionGuid	= @LocalizedVersionGuid,
		LastModifiedByUserID	= @LastModifiedByUserID,
		LastModifiedOnDate		= getdate()
	WHERE  TabModuleId = @TabModuleId
GO
