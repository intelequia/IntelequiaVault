SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSystemMessage]
 @PortalID     int,
 @MessageName  nvarchar(50)
AS
BEGIN
 if @PortalID is null
 begin
  select MessageValue
  from   dbo.SystemMessages
  where  PortalID is null and MessageName = @MessageName
 end else begin
  select MessageValue
  from   dbo.SystemMessages
  where  PortalID = @PortalID and MessageName = @MessageName
 end
END
GO
