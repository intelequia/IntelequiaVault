SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteModule]

@ModuleId   int

as

delete
from   dbo.Modules 
where  ModuleId = @ModuleId
GO
