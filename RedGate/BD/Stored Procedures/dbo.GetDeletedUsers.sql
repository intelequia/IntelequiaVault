SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDeletedUsers]
	@PortalID			int
AS
 IF @PortalID is null
  BEGIN
	SELECT  *
	FROM	dbo.vw_Users
	WHERE  PortalId IS Null
		AND IsDeleted = 1
	ORDER BY UserName
  END ELSE BEGIN
	SELECT  *
	FROM	dbo.vw_Users
	WHERE  PortalId = @PortalID		
		AND IsDeleted = 1
	ORDER BY UserName
  END
GO
