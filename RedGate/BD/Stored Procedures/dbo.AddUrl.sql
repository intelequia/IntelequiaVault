SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddUrl]

@PortalID     int,
@Url          nvarchar(255)

as

insert into dbo.Urls (
  PortalID,
  Url
)
values (
  @PortalID,
  @Url
)
GO
