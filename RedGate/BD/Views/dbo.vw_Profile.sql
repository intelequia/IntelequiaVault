SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_Profile]
AS
	SELECT     
		UP.UserID, 
		PD.PortalID, 
		PD.PropertyName, 
		CASE WHEN PropertyText IS NULL THEN PropertyValue ELSE PropertyText END AS PropertyValue, 
		UP.Visibility,
		UP.ExtendedVisibility,
		UP.LastUpdatedDate,
		PD.PropertyDefinitionID
	FROM dbo.[UserProfile] AS UP 
		INNER JOIN dbo.[ProfilePropertyDefinition] AS PD ON PD.PropertyDefinitionID = UP.PropertyDefinitionID
GO
