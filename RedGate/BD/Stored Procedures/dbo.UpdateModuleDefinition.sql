SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModuleDefinition]

	@ModuleDefId			int,    
	@FriendlyName			nvarchar(128),
	@DefinitionName			nvarchar(128),
	@DefaultCacheTime		int,
	@LastModifiedByUserID	int

as

update dbo.ModuleDefinitions 
	SET FriendlyName = @FriendlyName,
		DefinitionName = @DefinitionName,
		DefaultCacheTime = @DefaultCacheTime,
		LastModifiedByUserID = @LastModifiedByUserID,
		LastModifiedOnDate = getdate()
	WHERE ModuleDefId = @ModuleDefId
GO
