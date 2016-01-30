SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[UpdateUrlTrackingStats]

@PortalID     int,
@Url          nvarchar(255),
@ModuleId     int

as

update dbo.UrlTracking
set    Clicks = Clicks + 1,
       LastClick = getdate()
where  PortalID = @PortalID
and    Url = @Url
and    ((ModuleId = @ModuleId) or (ModuleId is null and @ModuleId is null))
GO
