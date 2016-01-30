SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPortalDesktopModule]
	@PortalID			int,
	@DesktopModuleId	int,
	@CreatedByUserID	int

as

insert into dbo.PortalDesktopModules ( 
	PortalId,
	DesktopModuleId,
	CreatedByUserID,
	CreatedOnDate,
	LastModifiedByUserID,
	LastModifiedOnDate
)
values (
	@PortalID,
	@DesktopModuleId,
	@CreatedByUserID,
	getdate(),
	@CreatedByUserID,
	getdate()
)

select SCOPE_IDENTITY()
GO
