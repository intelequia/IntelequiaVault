SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteUserRelationship] @UserRelationshipID INT	
AS 
	BEGIN
		DELETE FROM dbo.UserRelationships  
			WHERE UserRelationshipID = @UserRelationshipID
	END
GO
