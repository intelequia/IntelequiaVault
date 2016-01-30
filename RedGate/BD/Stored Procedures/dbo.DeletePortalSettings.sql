SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalSettings]
	@PortalID      Int,          -- Not Null
	@CultureCode   nVarChar(10)  -- Null|'' for all languages and neutral settings

AS
BEGIN
	DELETE FROM dbo.[PortalSettings]
	 WHERE (PortalID    = @PortalID)
	   AND (CultureCode = @CultureCode OR IsNull(@CultureCode, '') = '')
END
GO
