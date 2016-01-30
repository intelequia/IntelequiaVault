SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDesktopModulePermissions]
AS
    SELECT *
    FROM dbo.vw_DesktopModulePermissions
GO
