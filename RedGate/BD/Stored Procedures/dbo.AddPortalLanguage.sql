SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPortalLanguage]
    @PortalId			int,
    @LanguageId			int,
    @IsPublished		bit,
    @CreatedByUserID	int

AS
    INSERT INTO dbo.PortalLanguages (
        PortalId,
        LanguageId,
        IsPublished,
        [CreatedByUserID],
        [CreatedOnDate],
        [LastModifiedByUserID],
        [LastModifiedOnDate]
    )
    VALUES (
        @PortalId,
        @LanguageId,
        @IsPublished,
        @CreatedByUserID,
        getdate(),
        @CreatedByUserID,
        getdate()
    )

    SELECT SCOPE_IDENTITY()
GO
