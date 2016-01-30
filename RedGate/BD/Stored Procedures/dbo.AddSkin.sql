SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddSkin]
	@SkinPackageID		int,
    @SkinSrc			nvarchar(200)		
AS
	BEGIN
		IF NOT EXISTS (
			SELECT 1 FROM dbo.Skins S
				WHERE S.SkinPackageID = @SkinPackageID AND S.SkinSrc = @SkinSrc
			)
			BEGIN
				INSERT INTO dbo.Skins (SkinPackageID, SkinSrc)
				VALUES (@SkinPackageID, @SkinSrc)
			END
	END
	
	SELECT SkinID FROM dbo.Skins S
		WHERE S.SkinPackageID = @SkinPackageID AND S.SkinSrc = @SkinSrc
GO
