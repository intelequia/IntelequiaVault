SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetSortSQL]
(   -- deprecated, please call SortFieldSQL and FormattedString instead
    @SortBy        nVarChar(100),
    @SortAscending Bit,
    @Default       nVarChar(100)
)
	RETURNS 	   nVarChar(120)
AS
	BEGIN
		RETURN dbo.[FormattedString](dbo.[SortFieldSQL](@SortBy, @SortAscending, @Default), N'ORDER BY @0')
	END
GO
