SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[AddSystemMessage]

@PortalID     int,
@MessageName  nvarchar(50),
@MessageValue ntext

as

insert into dbo.SystemMessages (
  PortalID,
  MessageName,
  MessageValue
)
values (
  @PortalID,
  @MessageName,
  @MessageValue
)
GO
