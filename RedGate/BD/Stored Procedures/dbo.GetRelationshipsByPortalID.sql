SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRelationshipsByPortalID] @PortalID INT
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
	WHERE PortalID = @PortalID AND UserID IS NULL
	ORDER BY RelationshipID ASC
GO
