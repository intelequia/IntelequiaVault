SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabVersions]
	@TabId INT
AS
BEGIN
	SELECT   
		[TabVersionId],
		[TabId],
		[Version],
		[TimeStamp],
		[IsPublished],
	    [CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM dbo.[TabVersions]
	WHERE [TabId] = @TabId
END
GO
