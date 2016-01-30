SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRelationshipPreference] 
	@UserID INT,
	@RelationshipID INT
AS 
    SELECT  PreferenceID,
			UserID,
			RelationshipID,            
			DefaultResponse,            
            CreatedByUserID ,
            CreatedOnDate ,
            LastModifiedByUserID ,
            LastModifiedOnDate
    FROM    dbo.UserRelationshipPreferences    
	WHERE UserID = @UserID
	  AND RelationshipID = @RelationshipID
	ORDER BY UserID ASC, RelationshipID ASC
GO
