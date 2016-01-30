SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalDesktopModules]
    @PortalID        int,
    @DesktopModuleId int
AS
BEGIN
    IF @PortalID is not null AND @DesktopModuleId is not null
        DELETE FROM dbo.PortalDesktopModules WHERE PortalId = @PortalID AND DesktopModuleId = @DesktopModuleId
    ELSE 
        BEGIN
            IF @PortalID is not null
                DELETE FROM dbo.PortalDesktopModules WHERE PortalId = @PortalID
            ELSE
                BEGIN 
                    IF @DesktopModuleId is not null
                        DELETE FROM dbo.PortalDesktopModules WHERE DesktopModuleId = @DesktopModuleId
                END
        END
END
GO
