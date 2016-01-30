SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalLanguages]
    @PortalId   Int, -- Null ignored (use referential integrity to delete from all Portals)
    @LanguageId Int  -- Null ignored (use referential integrity to delete for all languages)
AS
BEGIN
    IF @PortalId Is Not Null AND IsNull(@LanguageId, -1) != -1 BEGIN
       DECLARE @CultureCode nVarchar(10);
       SELECT @CultureCode = CultureCode FROM dbo.[Languages] WHERE LanguageId = @LanguageId;
       DELETE FROM dbo.[PortalLanguages]    WHERE PortalId = @PortalId AND @LanguageId  = LanguageId;
       DELETE FROM dbo.[PortalLocalization] WHERE PortalId = @PortalId AND @CultureCode = CultureCode;
       DELETE FROM dbo.[PortalSettings]     WHERE PortalId = @PortalId AND @CultureCode = CultureCode;
    END
    -- ELSE rely on referential integrity (portal or language will be deleted as well)
END
GO
