SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetSystemMessages]

as

select MessageName
from   dbo.SystemMessages
where  PortalID is null
GO
