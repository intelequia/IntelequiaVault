SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemovePortalLocalization]
    @PortalId INT ,
    @CultureCode NVARCHAR(10)
AS 
    BEGIN
        SET NOCOUNT ON;

        DELETE  FROM dbo.PortalLocalization
        WHERE   PortalID = @PortalId
                AND CultureCode = @CultureCode

    END
GO
