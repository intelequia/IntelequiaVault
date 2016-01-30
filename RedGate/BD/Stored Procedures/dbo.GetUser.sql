SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUser]

	@PortalID int,
	@UserID int

AS
SELECT * FROM dbo.vw_Users U
WHERE  UserId = @UserID
	AND    (PortalId = @PortalID or IsSuperUser = 1)
GO
