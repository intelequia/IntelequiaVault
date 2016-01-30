SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddUser]

	@PortalID		int,
	@Username		nvarchar(100),
	@FirstName		nvarchar(50),
	@LastName		nvarchar(50),
	@AffiliateId    int,
	@IsSuperUser    bit,
	@Email          nvarchar(256),
	@DisplayName    nvarchar(100),
	@UpdatePassword	bit,
	@Authorised		bit,
	@CreatedByUserID int
AS

DECLARE @UserID int

SELECT @UserID = UserID
	FROM dbo.Users
	WHERE  Username = @Username

IF @UserID is null
	BEGIN
		INSERT INTO dbo.Users (
			Username,
			FirstName, 
			LastName, 
			AffiliateId,
			IsSuperUser,
			Email,
			DisplayName,
			UpdatePassword,
			CreatedByUserID,
			CreatedOnDate,
			LastModifiedByUserID,
			LastModifiedOnDate
		  )
		VALUES (
			@Username,
			@FirstName, 
			@LastName, 
			@AffiliateId,
			@IsSuperUser,
			@Email,
			@DisplayName,
			@UpdatePassword,
			@CreatedByUserID,
			getdate(),
			@CreatedByUserID,
			getdate()
		)

		SELECT @UserID = SCOPE_IDENTITY()
	END

	IF not exists ( SELECT 1 FROM dbo.UserPortals WHERE UserID = @UserID AND PortalID = @PortalID ) AND @PortalID > -1
		BEGIN
			INSERT INTO dbo.UserPortals (
				UserID,
				PortalID,
				Authorised,
				CreatedDate
			)
			VALUES (
				@UserID,
				@PortalID,
				@Authorised,
				getdate()
			)
		END

SELECT @UserID
GO
