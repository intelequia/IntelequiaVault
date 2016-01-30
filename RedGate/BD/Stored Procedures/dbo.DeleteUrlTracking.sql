SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteUrlTracking]

@PortalID     int,
@Url          nvarchar(255),
@ModuleID     int

as

delete
from   dbo.UrlTracking
where  PortalID = @PortalID
and    Url = @Url
and    ((ModuleId = @ModuleId) or (ModuleId is null and @ModuleId is null))
GO
