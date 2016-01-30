SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[UpdateSystemMessage]

@PortalID     int,
@MessageName  nvarchar(50),
@MessageValue ntext

as

update dbo.SystemMessages
set    MessageValue = @MessageValue
where  ((PortalID = @PortalID) or (PortalID is null and @PortalID is null))
and    MessageName = @MessageName
GO
