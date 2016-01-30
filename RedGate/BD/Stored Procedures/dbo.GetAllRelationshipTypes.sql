SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllRelationshipTypes]
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
	ORDER BY RelationshipTypeID ASC
GO
