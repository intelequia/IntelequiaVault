SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSynonymsGroup]
	@SynonymsGroupID int
AS
BEGIN	
	DELETE FROM dbo.SynonymsGroups WHERE SynonymsGroupID = @SynonymsGroupID
END
GO
