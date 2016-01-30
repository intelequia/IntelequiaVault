SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRelationship] @UserRelationshipID INT
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
	WHERE UserRelationshipID = @UserRelationshipID
	ORDER BY UserRelationshipID ASC
GO
