SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddScopeType] 
	@ScopeType			nvarchar(250)
AS
	INSERT INTO dbo.Taxonomy_ScopeTypes (
		ScopeType
	)

	VALUES (
		@ScopeType
	)

	SELECT SCOPE_IDENTITY()
GO
