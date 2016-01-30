SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateAnonymousUser]
    @UserID  char(36),
    @PortalID  int,
    @TabID   int,
    @LastActiveDate datetime 
as
begin
 update dbo.AnonymousUsers set 
  TabID = @TabID,
  LastActiveDate = @LastActiveDate
 where
  UserID = @UserID
  and PortalID = @PortalID

 if @@ROWCOUNT = 0
 begin
  insert into dbo.AnonymousUsers
   (UserID, PortalID, TabID, CreationDate, LastActiveDate) 
  VALUES
   (@UserID, @PortalID, @TabID, GetDate(), @LastActiveDate)
 end
end
GO
