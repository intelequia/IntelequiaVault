SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetUrls]

@PortalID     int

as

select *
from   dbo.Urls
where  PortalID = @PortalID
order by Url
GO
