SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteModuleControl]

@ModuleControlId int

as

delete
from   dbo.ModuleControls
where  ModuleControlId = @ModuleControlId
GO
