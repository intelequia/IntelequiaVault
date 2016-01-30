SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteTabModuleSettings]
@TabModuleId      int
as

DELETE FROM dbo.TabModuleSettings 
WHERE TabModuleId = @TabModuleId
GO
