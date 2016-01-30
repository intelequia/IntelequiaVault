SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteAuthentication]
	@AuthenticationID int
AS
	DECLARE @AuthType nvarchar(100)
	SET @AuthType = (SELECT AuthenticationType FROM dbo.Authentication WHERE AuthenticationID = @AuthenticationID)
	
	-- Delete UserAuthentication rows
	IF (@AuthType Is Not Null)
		BEGIN
			DELETE FROM dbo.UserAuthentication
				WHERE AuthenticationType = @AuthType
		END

	-- Delete Record
	DELETE 
		FROM   dbo.Authentication
		WHERE AuthenticationID = @AuthenticationID
GO
