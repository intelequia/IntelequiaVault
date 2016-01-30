SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetProfile]

@UserID    int, 
@PortalID  int

as

select *
from   dbo.Profile
where  UserId = @UserID 
and    PortalId = @PortalID
GO
