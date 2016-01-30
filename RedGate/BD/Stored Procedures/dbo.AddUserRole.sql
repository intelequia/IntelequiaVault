SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddUserRole]
	@PortalID		int,
	@UserID			int,
	@RoleId			int,
	@Status			int,
	@IsOwner		bit,
	@EffectiveDate	datetime = null,
	@ExpiryDate		datetime = null,
	@CreatedByUserID  int
AS

DECLARE @UserRoleId int

SELECT @UserRoleId = null

SELECT @UserRoleId = UserRoleId
	FROM dbo.UserRoles
	WHERE  UserId = @UserID AND RoleId = @RoleId
 
IF @UserRoleId IS NOT NULL
	BEGIN
		UPDATE dbo.UserRoles
			SET 
				Status = @Status,
				IsOwner = @IsOwner,
				ExpiryDate = @ExpiryDate,
				EffectiveDate = @EffectiveDate,
				IsTrialUsed = 1,
				LastModifiedByUserID = @CreatedByUserID,
				LastModifiedOnDate = getdate()
			WHERE  UserRoleId = @UserRoleId
		SELECT @UserRoleId
	END
ELSE
	BEGIN
		INSERT INTO dbo.UserRoles (
			UserId,
			RoleId,
			Status,
			IsOwner,
			EffectiveDate,
			ExpiryDate,
			IsTrialUsed,
			CreatedByUserID,
			CreatedOnDate,
			LastModifiedByUserID,
			LastModifiedOnDate
		  )
		VALUES (
			@UserID,
			@RoleId,
			@Status,
			@IsOwner,
			@EffectiveDate,
			@ExpiryDate,
			1,
			@CreatedByUserID,
			getdate(),
			@CreatedByUserID,
			getdate()
		  )

	SELECT SCOPE_IDENTITY()
    END
GO
