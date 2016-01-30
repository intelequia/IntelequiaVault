SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteSystemMessage]

@PortalID     int,
@MessageName  nvarchar(50)

as

delete
from   dbo.SystemMessages
where  PortalID = @PortalID
and    MessageName = @MessageName
GO
