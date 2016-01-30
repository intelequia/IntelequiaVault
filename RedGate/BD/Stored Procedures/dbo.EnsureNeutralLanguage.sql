SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EnsureNeutralLanguage]
    @PortalId INT ,
    @CultureCode NVARCHAR(10)
AS 
    BEGIN
        SET NOCOUNT ON;

        UPDATE  dbo.Tabs
        SET     CultureCode = NULL
        WHERE   PortalID = @PortalId
                AND CultureCode = @CultureCode
    END
GO
