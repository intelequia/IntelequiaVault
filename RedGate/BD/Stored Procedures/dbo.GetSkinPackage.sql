SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSkinPackage]
	@PortalID   int,
	@SkinName   nvarchar(50),
	@SkinType   nvarchar(50)

AS
	SELECT *
		FROM  dbo.SkinPackages
		WHERE (PortalID = @PortalID OR @PortalID IS NULL Or PortalID IS Null)
			AND SkinName = @SkinName
			AND SkinType = @SkinType
GO
