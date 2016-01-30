SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateUserRole]
    @UserRoleId		int, 
	@Status			int,
	@IsOwner		bit,
	@EffectiveDate	datetime = null,
	@ExpiryDate		datetime = null,
	@LastModifiedByUserID			int
AS
	UPDATE dbo.UserRoles 
		SET 
			Status = @Status,
			IsOwner = @IsOwner,
			ExpiryDate = @ExpiryDate,
			EffectiveDate = @EffectiveDate,
			IsTrialUsed = 1,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate()
		WHERE  UserRoleId = @UserRoleId
GO
