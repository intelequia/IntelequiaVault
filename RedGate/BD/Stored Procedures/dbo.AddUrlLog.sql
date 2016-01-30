SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddUrlLog]

@UrlTrackingID int,
@UserID        int

as

insert into dbo.UrlLog (
  UrlTrackingID,
  ClickDate,
  UserID
)
values (
  @UrlTrackingID,
  getdate(),
  @UserID
)
GO
