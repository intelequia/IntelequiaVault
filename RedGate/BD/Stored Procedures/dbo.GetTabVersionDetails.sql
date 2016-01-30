SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabVersionDetails]
	@TabVersionId INT
AS
BEGIN
	SELECT   
		[TabVersionDetailId] ,
        [TabVersionId] ,
		[ModuleId] ,
		[ModuleVersion] ,
		[PaneName] ,
		[ModuleOrder] ,
		[Action],
	    [CreatedByUserID] ,
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM dbo.[TabVersionDetails]
	WHERE [TabVersionId] = @TabVersionId
END
GO
