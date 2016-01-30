SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSkin]

	@SkinID   int,
	@SkinSrc  nvarchar(200)

AS
	UPDATE dbo.Skins
		SET
			SkinSrc = @SkinSrc
	WHERE SkinID = @SkinID
GO
