SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSkinControlByPackageID]
	@PackageID	int
AS
    SELECT *
    FROM   dbo.SkinControls
	WHERE PackageID = @PackageID
GO
