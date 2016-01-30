SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetLastAppliedIteration] 

	@Major  int,
	@Minor  int,
	@Build  int	

AS

	SELECT ISNULL(MAX(Increment),0) from dbo.Version WHERE Major=@Major AND Minor=@Minor AND Build=@Build
GO
