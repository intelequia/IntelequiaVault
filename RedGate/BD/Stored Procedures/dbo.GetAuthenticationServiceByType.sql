SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAuthenticationServiceByType]

	@AuthenticationType nvarchar(100)

AS
	SELECT *
		FROM  dbo.Authentication
		WHERE AuthenticationType = @AuthenticationType
GO
