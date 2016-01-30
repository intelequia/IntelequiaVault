SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRelationshipPreferenceByID] 
	@PreferenceID INT	
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
	WHERE @PreferenceID = @PreferenceID	  
	ORDER BY PreferenceID ASC
GO
