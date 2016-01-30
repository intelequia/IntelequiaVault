SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[GetUserProfile] 
	@UserID int
AS
	SELECT
		ProfileID,
		UserID,
		PropertyDefinitionID,
		CASE WHEN (PropertyValue Is Null) THEN PropertyText ELSE PropertyValue END AS 'PropertyValue',
		Visibility,
		ExtendedVisibility,
		LastUpdatedDate
	FROM	dbo.UserProfile
	WHERE   UserId = @UserID
GO
