SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddUserPortal]

	@PortalID		int,
	@UserID			int
AS

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
				1,
				getdate()
			)
		END
GO
