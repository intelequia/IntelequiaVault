SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddModuleDefinition]

	@DesktopModuleId int,    
	@FriendlyName    nvarchar(128),
	@DefinitionName nvarchar(128),
	@DefaultCacheTime int,
	@CreatedByUserID  int

as

insert into dbo.ModuleDefinitions (
	DesktopModuleId,
	FriendlyName,
	DefinitionName,
	DefaultCacheTime,
	CreatedByUserID,
	CreatedOnDate,
	LastModifiedByUserID,
	LastModifiedOnDate
)
values (
	@DesktopModuleId,
	@FriendlyName,
	@DefinitionName,
	@DefaultCacheTime,
	@CreatedByUserID,
	getdate(),
	@CreatedByUserID,
	getdate()
)

select SCOPE_IDENTITY()
GO
