SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteLanguagePack]

	@LanguagePackID		int

AS
    DELETE
	    FROM	dbo.LanguagePacks
	    WHERE   LanguagePackID = @LanguagePackID
GO
