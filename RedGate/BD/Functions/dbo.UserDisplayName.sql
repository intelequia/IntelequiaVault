SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- new helper function, returning Displayname for a userid
CREATE FUNCTION [dbo].[UserDisplayName]
(
	@userId Int
)
RETURNS 
	nVarChar(255)
AS
	BEGIN
		DECLARE @DisplayName AS nVarChar(255)

		SELECT  @DisplayName = DisplayName FROM dbo.[Users] WHERE UserID = @UserId
		RETURN  @DisplayName
	END
GO
