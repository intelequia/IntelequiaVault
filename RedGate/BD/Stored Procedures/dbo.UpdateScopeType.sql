SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateScopeType] 
	@ScopeTypeId				int,
	@ScopeType					nvarchar(250)
AS
	UPDATE dbo.Taxonomy_ScopeTypes 
		SET 
			ScopeType = @ScopeType
	WHERE ScopeTypeId = @ScopeTypeId
GO
