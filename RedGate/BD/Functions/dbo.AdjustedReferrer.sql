SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[AdjustedReferrer](
	@Referrer 	 nVarChar(2000),
	@PortalAlias nVarChar( 255)
	)
RETURNS nVarChar(2000)
AS
BEGIN
	RETURN CASE 
		WHEN @Referrer LIKE '%' + @PortalAlias + '%' THEN Null 
		ELSE @Referrer
	END
END
GO
