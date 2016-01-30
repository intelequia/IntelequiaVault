SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteModuleSettings]
@ModuleId      int
as

DELETE FROM dbo.ModuleSettings 
WHERE ModuleId = @ModuleId
GO
