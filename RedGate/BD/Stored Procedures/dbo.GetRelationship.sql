SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRelationship] @RelationshipID INT
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
	WHERE RelationshipID = @RelationshipID
	ORDER BY RelationshipID ASC
GO
