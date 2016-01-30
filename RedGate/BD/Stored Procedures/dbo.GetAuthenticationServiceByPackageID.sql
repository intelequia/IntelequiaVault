SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAuthenticationServiceByPackageID]

	@PackageID int

AS
	SELECT *
		FROM  dbo.Authentication
		WHERE PackageID = @PackageID
GO
