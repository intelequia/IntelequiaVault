SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddHtmlTextUser]

@ItemID          int,
@StateID         int,
@ModuleID        int,
@TabID           int,
@UserID          int

as

insert into dbo.HtmlTextUsers (
  ItemID,
  StateID,
  ModuleID,
  TabID,
  UserID,
  CreatedOnDate
)
values (
  @ItemID,
  @StateID,
  @ModuleID,
  @TabID,
  @UserID,
  getdate()
)
GO
