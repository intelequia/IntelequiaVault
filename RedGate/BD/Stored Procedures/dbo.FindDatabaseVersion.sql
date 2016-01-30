SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[FindDatabaseVersion]

@Major  int,
@Minor  int,
@Build  int

as

select 1
from   dbo.Version
where  Major = @Major
and    Minor = @Minor
and    Build = @Build
GO
