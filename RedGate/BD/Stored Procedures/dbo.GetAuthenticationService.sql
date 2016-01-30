SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAuthenticationService]

	@AuthenticationID int

AS
	SELECT *
		FROM   dbo.Authentication
		WHERE AuthenticationID = @AuthenticationID
GO
