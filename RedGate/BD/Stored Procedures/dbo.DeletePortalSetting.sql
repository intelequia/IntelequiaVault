SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePortalSetting]
	@PortalID      Int,          -- Not Null
	@SettingName   nVarChar(50), -- Not Null
	@CultureCode   nVarChar(10)  -- Null|'' for all languages and neutral settings
AS
BEGIN
	DELETE FROM dbo.[PortalSettings]
	 WHERE (PortalID    = @PortalID)
	   AND (SettingName = @SettingName)
	   AND (CultureCode = @CultureCode OR IsNull(@CultureCode, '') = '')
END
GO
