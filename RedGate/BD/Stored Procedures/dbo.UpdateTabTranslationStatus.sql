SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabTranslationStatus]
	@TabId					int,
    @LocalizedVersionGuid	uniqueidentifier,
	@LastModifiedByUserID	int
AS
	UPDATE dbo.Tabs
		SET
		LocalizedVersionGuid	= @LocalizedVersionGuid,
		LastModifiedByUserID	= @LastModifiedByUserID,
		LastModifiedOnDate		= getdate()
	WHERE  TabId = @TabId
GO
