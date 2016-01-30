SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetUsersByPropertyName]
(
	@PropertyName nvarchar(100),
	@PropertyValue nvarchar(max),
	@PortalID int
)
RETURNS TABLE
AS
	RETURN
		SELECT *
			FROM dbo.[vw_Profile]
			WHERE PropertyName = @PropertyName 
				AND PropertyValue LIKE @PropertyValue
				AND PortalID = @PortalID
GO
