SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetSearchIndexers]

as

select dbo.SearchIndexer.*
from dbo.SearchIndexer
GO
