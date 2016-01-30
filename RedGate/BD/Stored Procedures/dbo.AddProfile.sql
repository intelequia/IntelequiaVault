SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddProfile]

@UserID        int, 
@PortalID      int

as

insert into dbo.Profile (
  UserId,
  PortalId,
  ProfileData,
  CreatedDate
)
values (
  @UserID,
  @PortalID,
  '',
  getdate()
)
GO
