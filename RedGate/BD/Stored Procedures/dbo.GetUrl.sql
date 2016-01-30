SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetUrl]

@PortalID     int,
@Url          nvarchar(255)

as

select *
from   dbo.Urls
where  PortalID = @PortalID
and    Url = @Url
GO
