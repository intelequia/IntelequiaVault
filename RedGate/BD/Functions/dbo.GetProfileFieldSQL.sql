SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- results order added
CREATE FUNCTION [dbo].[GetProfileFieldSQL]
(
    @PortalID 	 Int,
    @TemplateSql nVarChar(max)
)
	RETURNS 	 nVarChar(max)
AS
	BEGIN
		DECLARE @sql nVarChar(max);

		SELECT @sql = COALESCE(@sql + ',','') + '[' + PropertyName + ']' + @TemplateSql
		 FROM dbo.[ProfilePropertyDefinition]
		 WHERE IsNull(PortalID, -1) = IsNull(@PortalID, -1)
		   AND Deleted = 0
		ORDER BY ViewOrder
		RETURN (@sql)
	END
GO
