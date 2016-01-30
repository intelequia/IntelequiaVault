SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPropertyDefinition]

	@PropertyDefinitionID	int

AS
SELECT	dbo.ProfilePropertyDefinition.*
FROM	dbo.ProfilePropertyDefinition
WHERE PropertyDefinitionID = @PropertyDefinitionID
	AND Deleted = 0
GO
