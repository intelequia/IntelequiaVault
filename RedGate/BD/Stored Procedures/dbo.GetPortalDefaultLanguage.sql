SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalDefaultLanguage]

	@PortalId            int

AS
	SELECT defaultlanguage
		FROM dbo.Portals
		where portalid=@PortalId
GO
