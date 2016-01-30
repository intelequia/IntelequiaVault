SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalSettings]
    @PortalId    Int,            -- not Null!
    @CultureCode nVarChar(20)    -- Null|'' for neutral language
AS
BEGIN
	DECLARE @DefaultLanguage nVarChar(20) = '';

	IF EXISTS (SELECT * FROM dbo.[PortalLocalization] L
					JOIN dbo.[Portals] P ON L.PortalID = P.PortalID AND L.CultureCode = P.DefaultLanguage
					WHERE P.PortalID = @PortalID)
		SELECT @DefaultLanguage = DefaultLanguage 
		FROM dbo.[Portals] 
		WHERE PortalID = @PortalID

	SELECT
		PS.SettingName,
		CASE WHEN Lower(PS.SettingValue) LIKE 'fileid=%'
			THEN dbo.[FilePath](PS.SettingValue)
			ELSE PS.SettingValue END   AS SettingValue,
		PS.CreatedByUserID,
		PS.CreatedOnDate,
		PS.LastModifiedByUserID,
		PS.LastModifiedOnDate,
		PS.CultureCode
		FROM dbo.[PortalSettings] PS
		WHERE PortalSettingID = (SELECT Top(1) PortalSettingID FROM dbo.[PortalSettings] S 
		                         WHERE PS.PortalID = S.PortalID AND PS.SettingName = S.SettingName 
								 ORDER BY CASE CultureCode WHEN @CultureCode THEN 2 WHEN Null THEN 1 ELSE 0 END DESC)
		  AND PortalID = @PortalID
	 ORDER BY SettingName
END
GO
