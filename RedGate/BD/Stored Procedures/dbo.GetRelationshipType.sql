SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRelationshipType] @RelationshipTypeID INT
AS 
    SELECT  RelationshipTypeID,
            Direction,
            Name ,            
            Description,
            CreatedByUserID ,
            CreatedOnDate ,
            LastModifiedByUserID ,
            LastModifiedOnDate
    FROM    dbo.RelationshipTypes    
	WHERE RelationshipTypeID = @RelationshipTypeID
	ORDER BY RelationshipTypeID ASC
GO
