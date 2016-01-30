SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[UpdateProfile]

@UserID        int, 
@PortalID      int,
@ProfileData   ntext

as

update dbo.Profile
set    ProfileData = @ProfileData,
       CreatedDate = getdate()
where  UserId = @UserID
and    PortalId = @PortalID
GO
