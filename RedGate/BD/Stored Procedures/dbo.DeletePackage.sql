SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePackage]
	@PackageID		int
AS
	DELETE 
		FROM   dbo.Packages
		WHERE  [PackageID] = @PackageID
GO
