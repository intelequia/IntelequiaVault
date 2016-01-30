SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePortalDefaultLanguage]

	@PortalId            int,
	@CultureCode   nvarchar(50)
AS
	UPDATE dbo.Portals
		SET defaultlanguage=@CultureCode
		where portalid=@PortalId
GO
