SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetLanguagePackByPackage]

	@PackageID int

AS
	SELECT * FROM dbo.LanguagePacks 
        WHERE  PackageID = @PackageID
GO
