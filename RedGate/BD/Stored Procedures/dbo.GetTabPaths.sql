SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabPaths] 
	@PortalID		INT,
	@CultureCode	NVARCHAR(10)
AS
	SELECT
		TabID, 
		PortalID, 
		TabPath
	FROM dbo.vw_Tabs
	WHERE (PortalID = @PortalID AND (CultureCode = @CultureCode OR CultureCode Is NULL OR ISNULL(@CultureCode, '') = ''))
		OR @PortalID Is NULL
GO
