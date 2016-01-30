SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- added, provides more flexibility, e.g. may be called again for multiple sort columns
CREATE FUNCTION [dbo].[SortFieldSQL]
(
    @SortBy        nVarChar(100), -- should be a field name
    @SortAscending Bit,			  -- ascending or descending?
    @Default       nVarChar(100)  -- name of field to be used if @sortby is empty
)
	RETURNS 	   nVarChar(110)
AS
	BEGIN
		DECLARE @sortSql nVarChar(110) =  ''
		IF IsNull(@SortBy, '') = ''
			SET @SortBy = IsNull(@Default, '')
		IF @SortBy <>  ''
			SET @sortSql = N'[' + @SortBy + CASE WHEN IsNull(@SortAscending, 1) = 0 THEN N'] DESC' ELSE N'] ASC' END
		RETURN @sortSql
	END
GO
