SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileVersionContent]

	@FileId		int,
	@Version	int

AS
	SELECT Content
	FROM dbo.[FileVersions]
	WHERE FileId = @FileId
		AND Version = @Version
GO
