SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteUserRelationshipPreference]
	@PreferenceID INT	
AS 
	BEGIN
		DELETE FROM dbo.UserRelationshipPreferences  
		WHERE PreferenceID = @PreferenceID

	END
GO
