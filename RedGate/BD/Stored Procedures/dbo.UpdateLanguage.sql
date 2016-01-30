SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateLanguage]

	@LanguageID			    int,
	@CultureCode		    nvarchar(50),
	@CultureName            nvarchar(200),
	@FallbackCulture        nvarchar(50),
	@LastModifiedByUserID	int

AS
	UPDATE dbo.Languages
		SET
			CultureCode = @CultureCode,
			CultureName = @CultureName,
			FallbackCulture = @FallbackCulture,
			[LastModifiedByUserID] = @LastModifiedByUserID,	
			[LastModifiedOnDate] = getdate()
	WHERE LanguageID = @LanguageID
GO
