SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPropertyDefinitionByName]
	@PortalID	int,
	@Name		nvarchar(50)

AS
SELECT	*
	FROM	dbo.ProfilePropertyDefinition
	WHERE  (PortalId = @PortalID OR (PortalId IS NULL AND @PortalID IS NULL))
		AND PropertyName = @Name
	ORDER BY ViewOrder
GO
