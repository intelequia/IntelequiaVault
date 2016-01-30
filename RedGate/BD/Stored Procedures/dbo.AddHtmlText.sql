SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddHtmlText]

@ModuleID        int,
@Content         ntext,
@Summary	     ntext,
@StateID         int,
@IsPublished     bit,
@UserID          int,
@History         int

as

declare @Version int

select @Version = max(Version) from dbo.HtmlText where ModuleID = @ModuleID

if @Version is null
  select @Version = 1
else
  select @Version = @Version + 1

insert into dbo.HtmlText (
  ModuleID,
  Content,
  Summary,
  Version,
  StateID,
  IsPublished,
  CreatedByUserID,
  CreatedOnDate,
  LastModifiedByUserID,
  LastModifiedOnDate
) 
values (
  @ModuleID,
  @Content,
  @Summary,
  @Version,
  @StateID,
  @IsPublished,
  @UserID,
  getdate(),
  @UserID,
  getdate()
)

if @History > 0
begin
  delete
  from   dbo.HtmlText
  where  ModuleID = @ModuleID
  and    Version <= (@Version - @History)
end

select SCOPE_IDENTITY()
GO
