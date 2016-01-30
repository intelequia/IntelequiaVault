SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabVersionDetailsHistory]
	@TabID iNT,
    @Version INT
AS
BEGIN    
	SELECT tvd.[TabVersionDetailId]
		  ,tvd.[TabVersionId]
		  ,tvd.[ModuleId]
		  ,tvd.[ModuleVersion]
		  ,tvd.[PaneName]
		  ,tvd.[ModuleOrder]
		  ,tvd.[Action]
		  ,tvd.[CreatedByUserID]
		  ,tvd.[CreatedOnDate]
		  ,tvd.[LastModifiedByUserID]
		  ,tvd.[LastModifiedOnDate]
	FROM dbo.[TabVersionDetails] tvd
	INNER JOIN dbo.[TabVersions] tv ON tvd.TabVersionId = tv.TabVersionId
	WHERE tv.Version <= @Version
		AND tv.TabId = @TabID
	ORDER BY tvd.CreatedOnDate 
END
GO
