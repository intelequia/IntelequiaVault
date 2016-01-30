SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItemsByModuleId] 
	@ModuleId int
AS
	SELECT * FROM dbo.ContentItems WHERE ModuleID = @ModuleId
GO
