SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteRelationshipType] @RelationshipTypeID INT	
AS 
	BEGIN
		DELETE FROM dbo.RelationshipTypes  
			WHERE RelationshipTypeID = @RelationshipTypeID
	END
GO
