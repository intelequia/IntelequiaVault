SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetDatabaseVersion]

as

select Major,
       Minor,
       Build
from   dbo.Version 
where  VersionId = ( select max(VersionId) from dbo.Version )
GO
