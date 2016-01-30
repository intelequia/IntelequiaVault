SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePropertyDefinition]

	@PropertyDefinitionId int

AS

UPDATE dbo.ProfilePropertyDefinition 
	SET Deleted = 1
	WHERE  PropertyDefinitionId = @PropertyDefinitionId
GO
