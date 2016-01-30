SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteLanguage]
	@LanguageID		Int -- Not Null
AS
BEGIN
    DECLARE @CultureCode AS nVarChar(10);
    SELECT @CultureCode = CultureCode FROM dbo.[Languages] WHERE LanguageId = @LanguageId;
    DELETE FROM dbo.[PortalLocalization] WHERE @CultureCode = CultureCode;
    DELETE FROM dbo.[PortalSettings]     WHERE @CultureCode = CultureCode;
    DELETE FROM dbo.[Languages]          WHERE @LanguageID  = LanguageID;
END
GO
