SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalSetting]
    @PortalID    Int,		    -- Not Null
    @SettingName nVarChar(50),	-- Not Null
    @CultureCode nVarChar(50)	-- Null|-1 for neutral language
AS
BEGIN
	SELECT TOP (1)
		SettingName,
		CASE WHEN Lower(SettingValue) Like 'fileid=%'
		 THEN dbo.[FilePath](SettingValue)
		 ELSE SettingValue 
		END   AS SettingValue,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate,
		CultureCode
	 FROM  dbo.[PortalSettings]
	 WHERE PortalID    = @PortalID
	   AND SettingName = @SettingName
	   AND COALESCE(CultureCode, @CultureCode,'') = IsNull(@CultureCode,'')
	 ORDER BY IsNull(CultureCode,'') DESC
END
GO
