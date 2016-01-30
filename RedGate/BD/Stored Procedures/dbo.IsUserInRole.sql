SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[IsUserInRole]
    
@UserID        int,
@RoleId        int,
@PortalID      int

as

select dbo.UserRoles.UserId,
       dbo.UserRoles.RoleId
from dbo.UserRoles
inner join dbo.Roles on dbo.UserRoles.RoleId = dbo.Roles.RoleId
where  dbo.UserRoles.UserId = @UserID
and    dbo.UserRoles.RoleId = @RoleId
and    dbo.Roles.PortalId = @PortalID
and    (dbo.UserRoles.ExpiryDate >= getdate() or dbo.UserRoles.ExpiryDate is null)
GO
