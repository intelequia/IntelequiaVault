SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteScopeType] 
	@ScopeTypeId			int
AS
	DELETE FROM dbo.Taxonomy_ScopeTypes
	WHERE ScopeTypeId = @ScopeTypeId
GO
