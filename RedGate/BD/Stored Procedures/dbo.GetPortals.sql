SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortals]
	@CultureCode	nVarChar(50) -- pass Null | '' to return portal default language
AS
BEGIN
	SELECT * 
	FROM  dbo.[vw_Portals]
	WHERE CultureCode = 
		CASE 
			WHEN IsNull(@CultureCode, N'') = N'' THEN DefaultLanguage
			ELSE @CultureCode 
		END 
	ORDER BY PortalName;
END
GO
