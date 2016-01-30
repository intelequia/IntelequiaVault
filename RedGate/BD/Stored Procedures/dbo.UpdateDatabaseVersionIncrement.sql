SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateDatabaseVersionIncrement] 

	@Major  int,
	@Minor  int,
	@Build  int,
	@Increment int,
	@Name	nvarchar(50)

AS

	UPDATE dbo.Version
	SET Increment=@Increment where Major=@Major AND Minor=@Minor AND Build=@Build AND Name=@Name
GO
