SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
	@UserID         int,
	@PortalID		int,
	@FirstName		nvarchar(50),
	@LastName		nvarchar(50),
	@IsSuperUser    bit,
	@Email          nvarchar(256),
	@DisplayName    nvarchar(100),
	@VanityUrl		nvarchar(100),
	@UpdatePassword	bit,
	@Authorised		bit,
	@RefreshRoles	bit,
	@LastIPAddress	nvarchar(50),
	@passwordResetToken uniqueidentifier,
	@passwordResetExpiration datetime,
	@IsDeleted		bit,
	@LastModifiedByUserID int,
	@HmacAppId nvarchar(256),
	@HmacAppSecret nvarchar(256) 
AS
	UPDATE dbo.Users
		SET
			FirstName = @FirstName,
			LastName = @LastName,
			IsSuperUser = @IsSuperUser,
			Email = @Email,
			DisplayName = @DisplayName,
			UpdatePassword = @UpdatePassword,
			PasswordResetToken=@passwordResetToken,
			PasswordResetExpiration=@passwordResetExpiration,
			LastIPAddress = @LastIPAddress,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate(),
			HmacAppId=@HmacAppId,
			HmacAppSecret=@HmacAppSecret
		WHERE  UserId = @UserID
	
	IF @PortalID IS NULL
		BEGIN
			UPDATE dbo.Users
				SET
					IsDeleted = @IsDeleted
				WHERE  UserId = @UserID
		END
	ELSE
		BEGIN
			UPDATE dbo.UserPortals
				SET
					Authorised = @Authorised,
					RefreshRoles = @RefreshRoles,
					VanityUrl = @VanityUrl,
					IsDeleted = @IsDeleted
				WHERE  UserId = @UserID
					AND PortalId = @PortalID
		END
GO
