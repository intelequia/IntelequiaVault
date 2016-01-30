SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPackages]
	@PortalID	int
AS
	SELECT *
		FROM   dbo.Packages
		WHERE (PortalID = @PortalID OR @PortalID IS NULL OR PortalID IS NULL)
		ORDER BY PackageType ASC, [FriendlyName] ASC
GO
