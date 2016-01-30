SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRelationshipsByUserID] @UserID INT
AS 
    SELECT  RelationshipID,
			RelationshipTypeID,            
            Name,            
            Description,
			UserID,
			PortalID,
			DefaultResponse,
            CreatedByUserID ,
            CreatedOnDate ,
            LastModifiedByUserID ,
            LastModifiedOnDate
    FROM    dbo.Relationships    
	WHERE UserID = @UserID
	ORDER BY RelationshipID ASC
GO
