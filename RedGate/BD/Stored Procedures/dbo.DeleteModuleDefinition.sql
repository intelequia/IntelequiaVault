SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteModuleDefinition]
	@ModuleDefId int
AS

-- delete custom permissions
DELETE FROM dbo.Permission
WHERE moduledefid = @ModuleDefId
	
DELETE FROM dbo.ModuleDefinitions
WHERE  ModuleDefId = @ModuleDefId
GO
