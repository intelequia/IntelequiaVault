SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddSearchCommonWord]
	@CommonWord nvarchar(255),
	@Locale nvarchar(10)
AS

INSERT INTO dbo.SearchCommonWords (
	[CommonWord],
	[Locale]
) VALUES (
	@CommonWord,
	@Locale
)

select SCOPE_IDENTITY()
GO
