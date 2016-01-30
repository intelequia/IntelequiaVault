SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_GetEditorHostSettings]
  AS
	SET NOCOUNT ON
    SELECT SettingName,
	       SettingValue
    FROM dbo.CKE_Settings
GO
