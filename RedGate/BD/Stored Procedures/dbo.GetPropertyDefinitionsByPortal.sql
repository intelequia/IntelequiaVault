SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPropertyDefinitionsByPortal]

	@PortalID	int

AS
SELECT	dbo.ProfilePropertyDefinition.*
	FROM	dbo.ProfilePropertyDefinition
	WHERE  (PortalId = @PortalID OR (PortalId IS NULL AND @PortalID IS NULL))		
	ORDER BY ViewOrder
GO
