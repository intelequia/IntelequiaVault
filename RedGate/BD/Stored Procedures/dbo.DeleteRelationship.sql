SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteRelationship] @RelationshipID INT	
AS 
	BEGIN
		DELETE FROM dbo.Relationships  
			WHERE RelationshipID = @RelationshipID
	END
GO
