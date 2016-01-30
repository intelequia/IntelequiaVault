SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateRole]
	@RoleId					int,
	@RoleGroupId			int,
	@RoleName				nvarchar(50),
	@Description			nvarchar(1000),
	@ServiceFee				money,
	@BillingPeriod			int,
	@BillingFrequency		char(1),
	@TrialFee				money,
	@TrialPeriod			int,
	@TrialFrequency			char(1),
	@IsPublic				bit,
	@AutoAssignment			bit,
	@RSVPCode				nvarchar(50),
	@IconFile				nvarchar(100),
	@LastModifiedByUserID	int,
	@Status					int,
	@SecurityMode			int,
	@IsSystemRole			bit
AS
	UPDATE dbo.Roles
	SET    RoleGroupId			= @RoleGroupId,
		   RoleName				= @RoleName,
		   Description			= @Description,
		   ServiceFee			= @ServiceFee,
		   BillingPeriod		= @BillingPeriod,
		   BillingFrequency		= @BillingFrequency,
		   TrialFee				= @TrialFee,
		   TrialPeriod			= @TrialPeriod,
		   TrialFrequency		= @TrialFrequency,
		   IsPublic				= @IsPublic,
		   AutoAssignment		= @AutoAssignment,
		   RSVPCode				= @RSVPCode,
		   IconFile				= @IconFile,
		   LastModifiedByUserID = @LastModifiedByUserID,
		   LastModifiedOnDate		= getdate(),
		   Status				= @Status,
		   SecurityMode			= @SecurityMode,
		   IsSystemRole			= @IsSystemRole
	WHERE  RoleId = @RoleId
GO
