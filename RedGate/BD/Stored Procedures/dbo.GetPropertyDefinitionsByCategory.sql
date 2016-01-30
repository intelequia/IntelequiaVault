SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPropertyDefinitionsByCategory]
	@PortalID	int,
	@Category	nvarchar(50)

AS
SELECT	*
	FROM	dbo.ProfilePropertyDefinition
	WHERE  (PortalId = @PortalID OR (PortalId IS NULL AND @PortalID IS NULL))
		AND PropertyCategory = @Category
	ORDER BY ViewOrder
GO
