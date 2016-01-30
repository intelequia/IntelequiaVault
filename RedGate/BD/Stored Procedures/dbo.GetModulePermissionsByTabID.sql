SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModulePermissionsByTabID]
    @TabId Int -- Not Null!
AS
    SELECT MP.*
    FROM        dbo.[Tabs]                 AS T
    INNER JOIN  dbo.[TabModules]           AS TM ON TM.TabID    = T.TabID
    INNER JOIN  dbo.[vw_ModulePermissions] AS MP ON TM.ModuleID = MP.ModuleID AND T.PortalID = MP.PortalID
    WHERE T.TabID = @TabId
GO
