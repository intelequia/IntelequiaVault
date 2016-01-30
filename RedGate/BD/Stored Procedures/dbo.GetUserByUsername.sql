SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserByUsername]

	@PortalID int,
	@Username nvarchar(100)

AS
	SELECT * FROM dbo.vw_Users
	WHERE  Username = @Username
		AND  ((@PortalId IS NULL) OR (PortalId = @PortalID) OR IsSuperUser = 1)
GO
