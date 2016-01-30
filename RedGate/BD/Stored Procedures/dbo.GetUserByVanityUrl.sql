SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserByVanityUrl]

	@PortalID int,
	@VanityUrl nvarchar(100)

AS
	SELECT * FROM dbo.vw_Users
	WHERE  VanityUrl = @VanityUrl
		AND  ((@PortalId IS NULL) OR (PortalId = @PortalID) OR IsSuperUser = 1)
GO
