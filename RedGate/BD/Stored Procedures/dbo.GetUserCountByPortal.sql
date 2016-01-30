SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserCountByPortal]
 @PortalId int
AS
begin
 SELECT count(*)
 FROM dbo.UserPortals AS UP
 WHERE UP.IsDeleted = 0 AND UP.PortalID = @PortalID
end
GO
