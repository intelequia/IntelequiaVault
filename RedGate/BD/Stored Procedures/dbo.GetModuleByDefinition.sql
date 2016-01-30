SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleByDefinition]
      @PortalId int,
      @DefinitionName nvarchar(128)
AS
	SELECT M.*   
	FROM dbo.vw_Modules M
		INNER JOIN dbo.ModuleDefinitions as MD ON M.ModuleDefID = MD.ModuleDefID
		INNER JOIN dbo.Tabs as T ON M.TabID = T.TabID
	WHERE ((M.PortalId = @PortalId) or (M.PortalId is null and @PortalID is null))
		AND MD.DefinitionName = @DefinitionName
		AND M.IsDeleted = 0
		AND T.IsDeleted = 0
GO
