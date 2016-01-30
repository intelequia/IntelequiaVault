SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserByDisplayName]

	@PortalID int,
	@DisplayName nvarchar(128)

AS
	SELECT * FROM dbo.vw_Users
	WHERE  DisplayName = @DisplayName
		AND  ((@PortalId IS NULL) OR (PortalId = @PortalID) OR IsSuperUser = 1)
GO
