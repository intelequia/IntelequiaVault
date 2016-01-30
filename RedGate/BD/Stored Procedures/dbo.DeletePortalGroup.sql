SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalGroup]
	@PortalGroupID	int
AS 
	BEGIN
		DELETE FROM dbo.PortalGroups  
			WHERE PortalGroupID = @PortalGroupID
	END
GO
