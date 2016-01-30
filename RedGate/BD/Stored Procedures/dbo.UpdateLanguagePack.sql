SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateLanguagePack]
	@LanguagePackID			int,
	@PackageID			    int,
	@LanguageID			    int,
	@DependentPackageID		int,
	@LastModifiedByUserID	int

AS
	UPDATE dbo.LanguagePacks
		SET
			PackageID = @PackageID,
			LanguageID = @LanguageID,
			DependentPackageID = @DependentPackageID,
			[LastModifiedByUserID] = @LastModifiedByUserID,	
			[LastModifiedOnDate] = GETDATE()
	WHERE LanguagePackID = @LanguagePackID

	SELECT @LanguagePackID
GO
