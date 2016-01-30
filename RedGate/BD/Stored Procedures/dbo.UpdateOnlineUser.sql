SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateOnlineUser]
@UserID 	INT,
@PortalID 	INT,
@TabID 		INT,
@LastActiveDate DATETIME 
AS
BEGIN
	IF EXISTS (SELECT UserID FROM dbo.Users WHERE UserID = @UserID)
	BEGIN
		IF EXISTS (SELECT UserID FROM dbo.UsersOnline WHERE UserID = @UserID and PortalID = @PortalID)
			UPDATE 
				dbo.UsersOnline
			SET 
				TabID = @TabID,
				LastActiveDate = @LastActiveDate
			WHERE
				UserID = @UserID
				and 
				PortalID = @PortalID
		ELSE
			INSERT INTO
				dbo.UsersOnline
				(UserID, PortalID, TabID, CreationDate, LastActiveDate) 
			VALUES
				(@UserID, @PortalID, @TabID, GetDate(), @LastActiveDate)
	END

END
GO
