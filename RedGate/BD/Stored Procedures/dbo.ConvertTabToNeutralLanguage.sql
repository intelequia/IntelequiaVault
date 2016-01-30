SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create PROCEDURE [dbo].[ConvertTabToNeutralLanguage]
    @PortalId INT ,
    @TabId INT ,
    @CultureCode NVARCHAR(10)
AS 
    BEGIN
        SET NOCOUNT ON;

        UPDATE  dbo.Tabs
        SET     CultureCode = NULL
        WHERE   PortalID = @PortalId
                AND TabID = @TabID
                AND CultureCode = @CultureCode
    END
GO
