SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFiles]	
    @PortalID int
AS
BEGIN
    IF @PortalID is null
    BEGIN
        DELETE FROM dbo.Files WHERE PortalId is null
    END ELSE BEGIN
        DELETE FROM dbo.Files WHERE PortalId = @PortalID
    END
END
GO
