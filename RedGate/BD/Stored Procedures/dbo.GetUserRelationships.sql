SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRelationships]
	@UserID INT
AS 
	SELECT  UserRelationshipID,
			UserID,
			RelatedUserID,
			RelationshipID,            
			Status,            
			CreatedByUserID ,
			CreatedOnDate ,
			LastModifiedByUserID ,
			LastModifiedOnDate
	FROM    dbo.UserRelationships    		
	WHERE UserID = @UserID OR RelatedUserID = @UserID
GO
