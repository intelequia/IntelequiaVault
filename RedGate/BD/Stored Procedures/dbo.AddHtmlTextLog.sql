SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddHtmlTextLog]

@ItemID          int,
@StateID         int,
@Comment         nvarchar(4000),
@Approved        bit,
@UserID          int

as

insert into dbo.HtmlTextLog (
  ItemID,
  StateID,
  Comment,
  Approved,
  CreatedByUserID,
  CreatedOnDate
)
values (
  @ItemID,
  @StateID,
  @Comment,
  @Approved,
  @UserID,
  getdate()
)
GO
