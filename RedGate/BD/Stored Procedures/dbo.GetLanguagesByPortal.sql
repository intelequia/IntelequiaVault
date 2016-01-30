SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetLanguagesByPortal]
    @PortalId			int
AS
    SELECT 
        L.*,
        PL.PortalId,
        PL.IsPublished
    FROM   dbo.Languages L
        INNER JOIN dbo.PortalLanguages PL On L.LanguageID = PL.LanguageID
    WHERE PL.PortalID = @PortalID
GO
