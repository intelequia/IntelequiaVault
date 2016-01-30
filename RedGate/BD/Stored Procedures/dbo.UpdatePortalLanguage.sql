SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePortalLanguage]
    @PortalId				int,
    @LanguageId				int,
    @IsPublished			bit,
    @LastModifiedByUserID  	int

AS
    UPDATE dbo.PortalLanguages 
        SET		
            IsPublished				= @IsPublished,
            LastModifiedByUserID	= @LastModifiedByUserID,
            LastModifiedOnDate		= getdate()
    WHERE PortalId = @PortalId
        AND LanguageId = @LanguageId
GO
