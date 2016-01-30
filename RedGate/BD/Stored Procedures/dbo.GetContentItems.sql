SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItems] 
	@ContentTypeId	int,
	@TabId			int,
	@ModuleId		int
AS
	SELECT *
	FROM dbo.ContentItems
	WHERE (ContentTypeId = @ContentTypeId OR @ContentTypeId IS NULL)
		AND (TabId = @TabId OR @TabId IS NULL)
		AND (ModuleId = @ModuleId OR @ModuleId IS NULL)
GO
