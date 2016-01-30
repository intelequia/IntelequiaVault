SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddUserAuthentication]
	@UserID					int,
	@AuthenticationType     nvarchar(100),
	@AuthenticationToken    nvarchar(1000),
	@CreatedByUserID	int

AS
	INSERT INTO dbo.UserAuthentication (
		UserID,
		AuthenticationType,
		AuthenticationToken,
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]

	)
	values (
		@UserID,
		@AuthenticationType,
		@AuthenticationToken,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()

	)

	SELECT SCOPE_IDENTITY()
GO
