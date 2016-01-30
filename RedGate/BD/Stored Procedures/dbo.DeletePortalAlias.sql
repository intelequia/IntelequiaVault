SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[DeletePortalAlias]
@PortalAliasID int

as

DELETE FROM dbo.PortalAlias 
WHERE PortalAliasID = @PortalAliasID
GO
