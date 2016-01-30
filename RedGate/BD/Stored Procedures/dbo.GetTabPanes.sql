SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetTabPanes]

@TabId    int

as

select distinct(PaneName) as PaneName
from   dbo.TabModules
where  TabId = @TabId
order by PaneName
GO
