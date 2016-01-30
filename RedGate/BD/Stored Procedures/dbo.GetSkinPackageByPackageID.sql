SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSkinPackageByPackageID]
	@PackageID int	
AS
BEGIN
 SELECT SP.*
  FROM  dbo.SkinPackages SP
  WHERE SP.PackageID = @PackageID

 SELECT I.*
  FROM  dbo.Skins I
 INNER JOIN dbo.SkinPackages S ON S.SkinPackageID = I.SkinPackageID
 WHERE S.PackageID = @PackageID
END
GO
