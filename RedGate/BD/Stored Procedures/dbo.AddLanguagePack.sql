SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddLanguagePack]

	@PackageID			    int,
	@LanguageID			    int,
	@DependentPackageID		int,
	@CreatedByUserID	int

AS
	INSERT INTO dbo.LanguagePacks (
		PackageID,
		LanguageID,
		DependentPackageID,
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]

	)
	VALUES (
		@PackageID,
		@LanguageID,
		@DependentPackageID,
		@CreatedByUserID,
	  	getdate(),
	  	@CreatedByUserID,
	  	getdate()
	)
	SELECT SCOPE_IDENTITY()
GO
