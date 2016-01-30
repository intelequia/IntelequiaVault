SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[UpdateDatabaseVersionAndName]

	@Major  int,
	@Minor  int,
	@Build  int,
	@Name	nvarchar(50)

AS

	INSERT INTO dbo.Version (
		Major,
		Minor,
		Build,
		[Name],
		CreatedDate
	)
		VALUES (
			@Major,
			@Minor,
			@Build,
			@Name,
			getdate()
		)
GO
