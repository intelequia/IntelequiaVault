SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSkinPackage]

	@SkinPackageID		int

AS
    DELETE
	    FROM	dbo.SkinPackages
	WHERE   SkinPackageID = @SkinPackageID
GO
