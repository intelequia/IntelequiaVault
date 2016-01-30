SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteUserRole]

@UserID int,
@RoleId int

as

delete
from dbo.UserRoles
where  UserId = @UserID
and    RoleId = @RoleId
GO
