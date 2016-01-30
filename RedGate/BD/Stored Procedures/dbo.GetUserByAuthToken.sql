SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserByAuthToken]

	@PortalId	int,
	@UserToken	nvarchar(1000),
	@AuthType	nvarchar(100)

AS
	SELECT u.* 
		FROM dbo.vw_Users u
			INNER JOIN dbo.UserAuthentication ua ON u.UserID = ua.UserID
	WHERE  ua.AuthenticationToken = @UserToken
		AND ua.AuthenticationType = @AuthType
		AND    (PortalId = @PortalId OR IsSuperUser = 1 OR @PortalId is null)
GO
