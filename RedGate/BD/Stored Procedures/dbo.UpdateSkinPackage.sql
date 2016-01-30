SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSkinPackage]
	@SkinPackageID  int,
	@PackageID      int,
	@PortalID       int,
	@SkinName       nvarchar(50),
	@SkinType       nvarchar(20),
	@LastModifiedByUserID	int
AS
	UPDATE dbo.SkinPackages
		SET
			PackageID = @PackageID,
			PortalID = @PortalID,
			SkinName = @SkinName,
			SkinType = @SkinType,
 			[LastModifiedByUserID] = @LastModifiedByUserID,	
			[LastModifiedOnDate] = getdate()
	WHERE SkinPackageID = @SkinPackageID
GO
