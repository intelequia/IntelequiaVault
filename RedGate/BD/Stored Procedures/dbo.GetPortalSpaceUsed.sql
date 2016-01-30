SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalSpaceUsed]
	@PortalId INT     -- Null|-1: Host files
AS
	BEGIN
		SELECT SUM(CAST(Size as bigint)) AS SpaceUsed
		FROM dbo.Files
		WHERE (IsNull(PortalID, -1) = IsNull(@PortalId, -1))
	END
GO
